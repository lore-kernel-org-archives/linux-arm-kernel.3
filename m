Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FCD1CA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Sep 2025 09:09:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g41c13NWV9jwHMWvIm9LbxXNid7LZCSCocg1Kjw6o8M=; b=RvK+jGLly+pza1h3z9Dnn55Ndl
	RfaK2N7Leyh5dRk/J0BQiuNISvpcEtWSaDWhZi8O47rManOsKnxiuNYEcj+D1feCMhY2gNIE2TAmt
	mx2JiANlkbPUCg/1BRZPvF239PdeOQXmXAZpWbH0NqrHFRkk9CJ2hlzz/3pCY1yt7cGP+k6DwzTMd
	H6L5SQGcrFUR6w5QZ+oSWUfhmhKPfraaXU3uP+hpi3lo0u8e4m02IXb3Pd9Rp4ceEi1z7QmQ5sSrL
	wx5Jjg8i+0m7aVlAtbihNjrBgeVo15kCOfi1wltXBjUVCgDezN2z84UKGTxL7IKYzHA+0IN+WQHVf
	CW72lsTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuSRr-00000000cax-40XH;
	Fri, 05 Sep 2025 09:09:35 +0000
Received: from mail-ua1-f47.google.com ([209.85.222.47])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuRCt-000000008p9-0Izt
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Sep 2025 07:50:04 +0000
Received: by mail-ua1-f47.google.com with SMTP id a1e0cc1a2514c-892196f0471so649660241.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 05 Sep 2025 00:50:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757058602; x=1757663402;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=g41c13NWV9jwHMWvIm9LbxXNid7LZCSCocg1Kjw6o8M=;
        b=u0MdeOnPmgM9je0tPt7GIaRGfrqbQMvNkWb60eCOujDtgH9GZM4H0Olc1ObV1HlYTn
         1LZWi9NIrcA5OXqnarB/Ej/fkbG+jpJqmPw0ozHchUu4Y79fO5Pi1Ue5LGMy1RfMjNGL
         esQkZ7WRWISHIslBgXPZsLQksaXDUOmzLKB+hBDDQ3aNseEhfKx8+e8DuFzA25QX8KyV
         iCiUzZAsiXbT4u6Nc5+NxN17a9Z6J40s9l5yf7324af59VLvhbPmU/dWlowAV4RVLQMo
         NUwwLtg8Ow7T9Kj27C5Rqe4waes2jq7/3TZlVVhy4AwiPZuBTJPgDoK7d4JpTD5rZ1eX
         QYIg==
X-Forwarded-Encrypted: i=1; AJvYcCXYaVY3VHbY6MNhicogQDrA3okC7SIQ69LHq0Z/lAr0AG/rzlERXQ3QPBNoMehXcP09GB14E0QQP7mc8f32DMMk@lists.infradead.org
X-Gm-Message-State: AOJu0Yw3at1z/P6aLRbKxdVMsao4VuCLN9eA89rTQ/OZVloeM/ykYxMx
	WP+JlXMATnoS/CZz5YfbjLV+GNt1uSveJBJ/FaUxfdSFPxuPTKPkI09VuQ56GSfX
X-Gm-Gg: ASbGncvDwDmh02VH5zHPfL/VekPZ2zrkPG5+YtnpG1Khz68lR8nLPKFHSHumOGcS9av
	cZ8TNaWtBpdoFDhctWklX2d5DKlhSvE8ugQwPgiHUdYXYjfBKoyqY19JMHqIutrz89M8CHI9vF1
	Zllphdc6DmbxA4SVJAiSXdm5YXswAuCIHoyPdlLU8+XEPf7dqdlc8uu0iOFEZfJOUAeWBx4Hbbf
	ms1lafScXpbp8sVgDm7cdR+shGEs9dwOuXRZY+PPL82hqBO6eQKuzhfMYdcuLqzBGoZDuSEMWc4
	5jnXmPbfH6uQSSR0u1DQB5gKoJVuyUjdIaKWMgqbRama3HLZk1kkwm0c32hPn3eBL6ECCyBMCge
	uwsXoQGMh+Px5F0VHrYCT1hocxdDsMW7ZMT2R6B/sPjAdwxM5PEq2iqFsG/g6
X-Google-Smtp-Source: AGHT+IF45p3L+64nfa87Vpymj2RkeMwceG7a2kDlV6xXnpQkUnSnlmWjBhFICR9UoiZmUJ95KzTB6g==
X-Received: by 2002:a67:e713:0:b0:519:534a:6c31 with SMTP id ada2fe7eead31-52b1c33ca0bmr7738778137.31.1757058601675;
        Fri, 05 Sep 2025 00:50:01 -0700 (PDT)
Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com. [209.85.222.43])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-8943ba55d60sm7798988241.10.2025.09.05.00.50.00
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Sep 2025 00:50:01 -0700 (PDT)
Received: by mail-ua1-f43.google.com with SMTP id a1e0cc1a2514c-8980d75995dso519273241.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 05 Sep 2025 00:50:00 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVci3pKYl1K0gTZKNGz6VTiAN7d2RQpDkLjUFMhgx8XzZhHuLnCFOVAh8myGJnVwfOeZgc/RbyTGgxQbBegfK7D@lists.infradead.org
X-Received: by 2002:a05:6102:4b84:b0:527:84e4:265 with SMTP id
 ada2fe7eead31-52b19534045mr8151301137.5.1757058600400; Fri, 05 Sep 2025
 00:50:00 -0700 (PDT)
MIME-Version: 1.0
References: <20250701114733.636510-1-ulf.hansson@linaro.org>
 <CAPDyKFr=u0u2ijczExkntHK1miWZ6hRrEWBMiyUwShS3m6c29g@mail.gmail.com>
 <CAMuHMdX1BacUfqtmV8g7NpRnY9aTdL=fh+jC7OryMLz4ijaOCg@mail.gmail.com>
 <CAPDyKFqANQZmGXd8ccA5qWiGrCor2N=W_7dmV+OK8hMd_+zmmw@mail.gmail.com>
 <CAMuHMdVrkr56XsRsbG7H-tLHVzmP+g-7=5Nrv9asC25ismwiYA@mail.gmail.com>
 <CAPDyKFq7z9e9hEC9QWiYcaU=t+Gs_GgRurmK-+cNYp4xkhr5Ow@mail.gmail.com>
 <CAMuHMdU7W+f3nZ_ckHOFsmmK6V9HzK0-fNtcu8kgjTSeU89AqQ@mail.gmail.com>
 <CAPDyKFr-mVbGo62Wp+othcs+cWR6Wn9bz==ZB5hSpyKgkGtqHg@mail.gmail.com>
 <CAMuHMdUAhsZMbkUzwb=XnCNyvA3aOvuhkKL4=1nOPQ0w0if-HA@mail.gmail.com> <CAPDyKFrWv3ObciCtrb4YE_K6to5xxx79DGcPv0=nP9LR60=xYA@mail.gmail.com>
In-Reply-To: <CAPDyKFrWv3ObciCtrb4YE_K6to5xxx79DGcPv0=nP9LR60=xYA@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 5 Sep 2025 09:49:48 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXoLnQR_hB-jXeGxAudwwpFRcQjrQcCb8iYCOz32yHinw@mail.gmail.com>
X-Gm-Features: Ac12FXxsmJginKpxd1Bb3DOpcRL3N2fGsIcySobleVuR7bO4K7fM-l9wOi9dDY0
Message-ID: <CAMuHMdXoLnQR_hB-jXeGxAudwwpFRcQjrQcCb8iYCOz32yHinw@mail.gmail.com>
Subject: Re: [PATCH v3 00/24] pmdomain: Add generic ->sync_state() support to genpd
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: Saravana Kannan <saravanak@google.com>, Stephen Boyd <sboyd@kernel.org>, linux-pm@vger.kernel.org, 
	"Rafael J . Wysocki" <rafael@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Michael Grzeschik <m.grzeschik@pengutronix.de>, Bjorn Andersson <andersson@kernel.org>, 
	Abel Vesa <abel.vesa@linaro.org>, Peng Fan <peng.fan@oss.nxp.com>, 
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, Johan Hovold <johan@kernel.org>, 
	Maulik Shah <maulik.shah@oss.qualcomm.com>, Michal Simek <michal.simek@amd.com>, 
	Konrad Dybcio <konradybcio@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Hiago De Franco <hiago.franco@toradex.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250905_005003_121755_3A673F3A 
X-CRM114-Status: GOOD (  77.30  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Hi Ulf,

On Thu, 4 Sept 2025 at 17:44, Ulf Hansson <ulf.hansson@linaro.org> wrote:
> On Thu, 4 Sept 2025 at 14:41, Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > On Thu, 14 Aug 2025 at 17:50, Ulf Hansson <ulf.hansson@linaro.org> wrote:
> > > On Wed, 13 Aug 2025 at 13:58, Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > > > On Tue, 12 Aug 2025 at 12:01, Ulf Hansson <ulf.hansson@linaro.org> wrote:
> > > > > On Thu, 7 Aug 2025 at 11:38, Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > > > > > On Wed, 30 Jul 2025 at 12:29, Ulf Hansson <ulf.hansson@linaro.org> wrote:
> > > > > > > On Wed, 30 Jul 2025 at 11:56, Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > > > > > > > On Wed, 9 Jul 2025 at 13:31, Ulf Hansson <ulf.hansson@linaro.org> wrote:
> > > > > > > > > On Tue, 1 Jul 2025 at 13:47, Ulf Hansson <ulf.hansson@linaro.org> wrote:
> > > > > > > > > > Changes in v3:
> > > > > > > > > >         - Added a couple of patches to adress problems on some Renesas
> > > > > > > > > >         platforms. Thanks Geert and Tomi for helping out!
> > > > > > > > > >         - Adressed a few comments from Saravanna and Konrad.
> > > > > > > > > >         - Added some tested-by tags.
> > > > > > > > >
> > > > > > > > > I decided it was time to give this a try, so I have queued this up for
> > > > > > > > > v6.17 via the next branch at my pmdomain tree.
> > > > > > > > >
> > > > > > > > > If you encounter any issues, please let me know so I can help to fix them.
> > > > > > > >
> > > > > > > > Thanks for your series!  Due to holidays, I only managed to test
> > > > > > > > this very recently.
> > > > > > > >
> > > > > > > > Unfortunately I have an issue with unused PM Domains no longer being
> > > > > > > > disabled on R-Car:
> > > > > > > >   - On R-Car Gen1/2/3, using rcar-sysc.c, unused PM Domains are never
> > > > > > > >     disabled.
> > > > > > > >   - On R-Car Gen4, using rcar-gen4-sysc.c, unused PM Domains are
> > > > > > > >     sometimes not disabled.
> > > > > > > >     At first, I noticed the IOMMU driver was not enabled in my config,
> > > > > > > >     and enabling it did fix the issue.  However, after that I still
> > > > > > > >     encountered the issue in a different config that does have the
> > > > > > > >     IOMMU driver enabled...
> > > > > > > >
> > > > > > > > FTR, unused PM Domains are still disabled correctly on R/SH-Mobile
> > > > > > > > (using rmobile-sysc.c) and on BeagleBone Black. Note that these use
> > > > > > > > of_genpd_add_provider_simple(), while all R-Car drivers use
> > > > > > > > of_genpd_add_provider_onecell().  Perhaps there is an issue with
> > > > > > > > the latter?  If you don't have a clue, I plan to do some more
> > > > > > > > investigation later...
> > > > > >
> > > > > > of_genpd_add_provider_onecell() has:
> > > > > >
> > > > > >     if (!dev)
> > > > > >             sync_state = true;
> > > > > >     else
> > > > > >             dev_set_drv_sync_state(dev, genpd_sync_state);
> > > > > >
> > > > > >     for (i = 0; i < data->num_domains; i++) {
> > > > > >             ...
> > > > > >             if (sync_state && !genpd_is_no_sync_state(genpd)) {
> > > > > >                     genpd->sync_state = GENPD_SYNC_STATE_ONECELL;
> > > > > >                     device_set_node(&genpd->dev, fwnode);
> > > > > >                     sync_state = false;
> > > > > >                     ^^^^^^^^^^^^^^^^^^^
> > > > > >             }
> > > > > >             ...
> > > > > >     }
> > > > > >
> > > > > > As the R-Car SYSC drivers are not platform drivers, dev is NULL, and
> > > > > > genpd->sync_state is set to GENPD_SYNC_STATE_ONECELL for the first PM
> > > > > > Domain only.  All other domains have the default value of sync_state
> > > > > > (0 = GENPD_SYNC_STATE_OFF).  Hence when genpd_provider_sync_state()
> > > > > > is called later, it ignores all but the first domain.
> > > > > > Apparently this is intentional, as of_genpd_sync_state() tries to
> > > > > > power off all domains handled by the same controller anyway (see below)?
> > > > >
> > > > > Right, this is intentional and mainly because of how fw_devlink works.
> > > > >
> > > > > fw_devlink is limited to use only the first device - if multiple
> > > > > devices share the same fwnode. In principle, we could have picked any
> > > > > of the devices in the array of genpds here - and reached the same
> > > > > result.
> > > >
> > > > OK, just like I already assumed...
> > > >
> > > > > > > > BTW, the "pending due to"-messages look weird to me.
> > > > > > > > On R-Car M2-W (r8a7791.dtsi) I see e.g.:
> > > > > > > >
> > > > > > > >     genpd_provider ca15-cpu0: sync_state() pending due to e6020000.watchdog
> > > > > > > >     renesas-cpg-mssr e6150000.clock-controller: sync_state() pending
> > > > > > > > due to e6020000.watchdog
> > > > > > > >
> > > > > > > > ca15-cpu0 is the PM Domain holding the first CPU core, while
> > > > > > > > the watchdog resides in the always-on Clock Domain, and uses the
> > > > > > > > clock-controller for PM_CLK handling.
> > > > > >
> > > > > > Unfortunately the first PM Domain is "ca15-cpu0", which is blocked on
> > > > > > these bogus pending states, and no PM Domain is powered off.
> > > > >
> > > > > I see, thanks for the details. I am looking closer at this.
> > > > >
> > > > > In any case, this is the main issue, as it prevents the ->sync_state()
> > > > > callback to be called. Hence the "genpd->stay_on" will also *not* be
> > > > > cleared for any of the genpd's for the genpd-provider.
> > > >
> > > > I was under the impression there is a time-out, after which the
> > > > .sync_state() callback would be called anyway, just like for probe
> > > > deferral due to missing optional providers like DMACs and IOMMUs.
> > > > Apparently that is not the case?
> > >
> > > The behaviour is configurable, so it depends. The current default
> > > behaviour does *not* enforce the ->sync_state() callbacks to be
> > > called, even after a time-out.
> > >
> > > You may set CONFIG_FW_DEVLINK_SYNC_STATE_TIMEOUT to achieve the above
> > > behavior or use the fw_devlink command line parameters to change it.
> > > Like setting "fw_devlink.sync_state=timeout".
> > >
> > > I guess it can be debated what the default behaviour should be.
> > > Perhaps we should even allow the default behaviour to be dynamically
> > > tweaked on a per provider device/driver basis?
> >
> > The domains are indeed powered off like before when passing
> > "fw_devlink.sync_state=timeout", so that fixes the regression.
> > But it was not needed before...
>
> Right, the default behavior in genpd has changed. The approach was
> taken as we believed that original behavior was not correct.
>
> Although, the current situation isn't good as it causes lot of churns for us.

I did some more testing, and there seems to be a similar issue with
DMA controllers, which I hadn't really noticed before, as I have
DMAC drivers built-in in all my kernel configs.  If the (optional)
DMAC driver is not available, you need "fw_devlink=permissive" to make
drivers probe devices that have (optional) DMA support.
Interestingly, that is not the case with (optional) IOMMU support:
drivers do probe devices that have (optional) DMA support when the
latter is not available.

> > I could add "select FW_DEVLINK_SYNC_STATE_TIMEOUT" to the SYSC_RCAR
> > and SYSC_RCAR_GEN4 Kconfig options, but that would play badly with
> > multi-platform kernels.  As the fw_devlink_sync_state flag is static,
> > the R-Car SYSC drivers can't just auto-enable the flag at runtime.
> >
> > Any other options? Perhaps a device-specific flag to be set by the PM
> > Domain driver, and to be checked by fw_devlink_dev_sync_state()?
>
> Something along those lines seems reasonable to me too.
>
> However, the remaining question though, is what should be the default
> behavior in genpd for this. Due to all the churns, we may want
> something that is closer to what we had *before*, which means to
> always use the timeout option, unless the genpd provider driver
> explicitly requests to not to (an opt-out genpd config flag).
>
> Saravana, it would be nice to get some thoughts from you are around
> this? Does it make sense?
>
> >
> > > > > > If I remove the "sync_state = false" above, genpd_provider_sync_state()
> > > > > > considers all domains, and does power down all unused domains (even
> > > > > > multiple times, as expected).
> > > > >
> > > > > I think those are getting called because with the change above, there
> > > > > is no device_link being tracked. As stated above, fw_devlink is
> > > > > limited to use only one device - if multiple devices share the same
> > > > > fwnode.
> > > >
> > > > Indeed.
> > > >
> > > > > In other words, the ->sync_state() callbacks are called even if the
> > > > > corresponding consumer devices have not been probed yet.
> > > >
> > > > Hence shouldn't there be a timeout, as the kernel may not even have
> > > > a driver for one or more consumer devices?
> > >
> > > See above.
> > >
> > > > > > Upon closer look, all "pending due to" messages I see claim that the
> > > > > > first (index 0) PM Domain is pending on some devices, while all of
> > > > > > these devices are part of a different domain (usually the always-on
> > > > > > domain, which is always the last (32 or 64) on R-Car).
> > > > > >
> > > > > > So I think there are two issues:
> > > > > >   1. Devices are not attributed to the correct PM Domain using
> > > > > >      fw_devlink sync_state,
> > > > > >   2. One PM Domain of a multi-domain controller being blocked should
> > > > > >      not block all other domains handled by the same controller.
> > > > >
> > > > > Right, that's a current limitation with fw_devlink. To cope with this,
> > > > > it's possible to enforce the ->sync_state() callback to be invoked
> > > > > from user-space (timeout or explicitly) for a device.
> >
> > That needs explicit handling, which was not needed before.
> >
> > Perhaps the fw_devlink creation should be removed again from
> > of_genpd_add_provider_onecell(), as it is not correct, except for
> > the first domain?
>
> There is nothing wrong with it, the behavior is correct, unless I
> failed to understand your problem. To me the problem is that it is

It does print wrong and confusing warnings indicating the problem:

    genpd_provider ca57-cpu0: sync_state() pending due to fe000000.pcie

(no, the PCIe controller is not part of the CPU PM Domain)

> just less fine grained, compared to using
> of_genpd_add_provider_simple(). All PM domains that is provided by a
> single power-domain controller that uses #power-domain-cells = <1>,
> requires all consumers of them to be probed, to allow the sync_state
> callback to be invoked.

if it would be just coarse-grained, the link should be created to a
device representing the controller, not to the device representing
the first PM domain.

> If we could teach fw_devlink to take into account the
> power-domain-*id* that is specified by the consumer node, when the
> provider is using #power-domain-cells = <1>, this could potentially
> become as fine-grained as of_genpd_add_provider_simple().
>
> Saravana, do think we can extend fw_devlink to take this into account somehow?

Doesn't the pmdomain core create a device for each PM domain, so the
index could be used to link to the correct domain?

> > > > > Another option would be to allow an opt-out behavior for some genpd's
> > > > > that are powered-on at initialization. Something along the lines of
> > > > > the below.
> > > > >
> > > > > From: Ulf Hansson <ulf.hansson@linaro.org>
> > > > > Date: Tue, 29 Jul 2025 14:27:22 +0200
> > > > > Subject: [PATCH] pmdomain: core: Allow powered-on PM domains to be powered-off
> > > > >  during boot
> > > >
> > > > [...]
> > > >
> > > > I gave this a try (i.e. "| GENPD_FLAG_NO_STAY_ON" in rcar-sysc.c), but
> > > > this doesn't make any difference.  I assume this would only work when
> > > > actively calling genpd_power_off() (i.e. not from of_genpd_sync_state()
> > > > or genpd_provider_sync_state())?
> > >
> > > Right. Thanks for testing!
> > >
> > > So, we may need to restore some part of the genpd_power_off_unused()
> > > when CONFIG_PM_GENERIC_DOMAINS_OF is set. Without clearing
> > > "genpd->stay_on".
> > >
> > > I can extend the patch, if you think it would make sense for you?
> >
> > I would applaud anything that would fix these regressions.
> > Thanks!
>
> While being mostly silent from my side for a while, I have been
> continuing to evolve my test suite for sync_state tests. Wanted to
> make sure I cover additional new corner cases that you have pointed
> out for Renesas platforms.
>
> That said, I have not observed any issues on my side, so it looks like
> we are simply facing new behaviors that you have pointed out to be a
> problem. In this regards, I think it's important to note that we are
> currently only seeing problems for those genpds that are powered-on
> when the provider driver calls pm_genpd_init(). Another simple option
> is to power-off those PM domains that we know is not really needed to
> be powered-on. Also not perfect, but an option.
>
> Another option is something along the lines of what I posted, but
> perhaps extending it to let the late_initcall_sync to try to power-off
> the unused PM domains.

Yep, like before.

> I will work on updating the patch so we can try it out - or perhaps
> what you suggested above with a device-specific flag taken into
> account by fw_devlink_dev_sync_state() would be better/sufficient you
> think?

I also had a closer look at the few pending sync_state() pending
warnings I do see on SH/R-Mobile SoCs.  Their PM Domain driver uses
of_genpd_add_provider_simple() instead of of_genpd_add_provider_onecell().
E.g. on R-Mobile A1:

    genpd_provider a3sm: sync_state() pending due to f0100000.cache-controller
    genpd_provider a4s: sync_state() pending due to fe400000.memory-controller
    genpd_provider d4: sync_state() pending due to ptm

All three domains were already handled specially in the PM Domain
driver, as they must not be turned off, so these platforms didn't
regress due to this series.

Thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

