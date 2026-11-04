Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FA22606A328
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Nov 2026 12:30:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=OpjZmxzv;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=i+eOpIVC
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=nLTKrRV7zGj2+I2eiQhkslScmWRTzYP0lSx7u0c6KX0=; b=OpjZmxzvjcBT4v
	4x92lHrLOgtWWjhpRVC0tkd77/PCacur00c0SjKeUtwkdm1ec9+uae2cyP76GEBlAE5rQMPrndVLa
	B5AvMi4bE0ZFzo5LM9DoJRT1RzJxHfP0BQsTKpWtJ8aoL082EPD+UP+XSSfJMtTrMWOIiALsJJoyO
	hyQZO5Z/3nzCHFHYT/44nX6YNYB49gCNjeLSQhS+WQp/hFYkDp0JHzbfq6LtmxYA+ye3/Ty1VoQdB
	+QSJK4xXB8JBlTuJfysdw2yIUdESM4L/RuxFnynZQEUYpPXx1tKVPFqjAUJfFZn7HbuwjxJhet5oo
	cMIs3TZkXGpujE9A3dcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOa8g-00000005Kfh-3wk8;
	Wed, 04 Nov 2026 12:30:50 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOa8f-00000005Kee-0gPh
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Nov 2026 12:30:49 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 5CA0062FFE
	for <linux-arm-kernel@lists.infradead.org>; Wed,  4 Nov 2026 12:30:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16FAC1F00A15
	for <linux-arm-kernel@lists.infradead.org>; Wed,  4 Nov 2026 12:30:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793795448;
	bh=nLTKrRV7zGj2+I2eiQhkslScmWRTzYP0lSx7u0c6KX0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=i+eOpIVCD6c9q3d8U7OaPRj1DAkcCbwKg0e0/FB4gvbWHhi53k/RkjVa0uRQXDCQ1
	 zAvMD+YbSdnJSgGy25maWzemVTB7PwuC1McmSi1j6y2JieTGBPLJN1h2Z1OLzBVXPg
	 j48YnItp8Vtjr5vRU1ggfwvm9WN+pdGbfrSw0o+XLh5yr3ygW4Gu+yKjE0BlN9XR5y
	 uEjIJ0p/MAGSP2G908hwhZduD9zfnPlyPpCVzp4pdXsXiMWLorsj50bnoaX7EhOjjh
	 Wu54b2wlES4jjZJ41wtWivS0w+8qvi5sNm7SSJtwrhbfe+SsghRpIg3Xir1PcIdSlC
	 Pnt6va1saxJIQ==
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5bfbc25a76aso2075457e87.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Nov 2026 04:30:48 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBz5VA3guM0lSEG2O/TB3hdWHA/OA83rDtIIDzloTpczL6c9yFX3YOGvxXWmck6c7wuhkJZoZtFvEtzb9Il5/xwI@lists.infradead.org
X-Gm-Message-State: APuU4Z98iK0HEdQoYa4cNauobZgFiRl4KUTy5s/7Z61ysGoeZmbt0nRH
	7e1JM8jMyd8SF74tEKNIqPWCLNYCYTuFJ4CF+zdWdN6TublL16PFWgypRsoFw1vwfBcEE0RXPA/
	a9pSXM0DAelBCIDTGSvJ8vrcM+ezBjvc=
X-Received: by 2002:a05:6512:a8c:b0:5bf:c97d:d170 with SMTP id
 2adb3069b0e04-5bfd11f352bmr5131215e87.17.1793795446847; Wed, 04 Nov 2026
 04:30:46 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261001085217.1778645-1-alexander.sverdlin@siemens.com>
In-Reply-To: <20261001085217.1778645-1-alexander.sverdlin@siemens.com>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 4 Nov 2026 13:30:34 +0100
X-Gmail-Original-Message-ID: <CAD++jLn8yxh3LmUzbb2vZfJFJB=_mCZ+VeQhnZktfmuMiv5uEg@mail.gmail.com>
X-Gm-Features: AclHuK_xh55IfYWDcMEadkkQPRWoFw-pLiRPci8jz0ty-rrKgkyopgwVmzEI3cA
Message-ID: <CAD++jLn8yxh3LmUzbb2vZfJFJB=_mCZ+VeQhnZktfmuMiv5uEg@mail.gmail.com>
Subject: Re: [PATCH 0/2] pinctrl: fix group/function table leaks on consumer re-probe
To: "A. Sverdlin" <alexander.sverdlin@siemens.com>
Cc: linux-gpio@vger.kernel.org, Tony Lindgren <tony@atomide.com>, 
	Haojian Zhuang <haojian.zhuang@linaro.org>, Lokesh Vutla <lokeshvutla@ti.com>, 
	Nishanth Menon <nm@ti.com>, Rob Herring <robh@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, Oct 1, 2026 at 10:52=E2=80=AFAM A. Sverdlin
<alexander.sverdlin@siemens.com> wrote:

> From: Alexander Sverdlin <alexander.sverdlin@siemens.com>
>
> Pinctrl drivers that create their groups/functions lazily from the
> consumer's device-tree node in .dt_node_to_map() leak the per-mapping
> tables when the same node is mapped again. The core deduplicates
> groups/functions by name and keeps the first instance for the controller'=
s
> lifetime, so it silently drops the copies built on every subsequent
> mapping - e.g. on each re-probe of the consumer device. kmemleak does not
> flag them because they stay reachable from the controller's devres list.
>
> Reproducer (patch 1, pinctrl-single) - any board where a device referenci=
ng
> a pinctrl-single state is repeatedly re-probed; here an I2C TPM whose nod=
e
> has a "default" pinctrl state:
>
>   while modprobe tpm_tis_i2c; do rmmod tpm_tis_i2c; done
>
> The tables land in a generic kmalloc-N cache (kmalloc-192 on arm64, where
> ARCH_KMALLOC_MINALIGN pads every devres allocation; the bucket differs by
> config), so watch it cache-independently by diffing /proc/slabinfo after
> dropping the reclaimable slab:
>
>   sync; echo 3 > /proc/sys/vm/drop_caches
>   cat /proc/slabinfo | awk 'NR>2{print $1,$2}' | sort > /tmp/a
>   <run N cycles>
>   sync; echo 3 > /proc/sys/vm/drop_caches
>   cat /proc/slabinfo | awk 'NR>2{print $1,$2}' | sort > /tmp/b
>   join /tmp/a /tmp/b | awk '$3>$2{print $1,$3-$2}'
>
> Patch 1 (pinctrl-single) was found and fixed with the above test on real
> hardware. Patch 2 (ti-iodelay) has the same bug pattern - plus a missing
> .dt_free_map that leaks the mapping table as well - but was found by code
> review only and is compile-tested only; I have no such hardware to
> reproduce it.
>
> Alexander Sverdlin (2):
>   pinctrl: single: don't leak group/function tables on consumer re-probe
>   pinctrl: ti-iodelay: fix memory leaks on consumer re-probe

I got exactly zero reviews on this patch set from the pinctrl-single
maintainers, so I have now just applied it.

Maybe the old maintainers have other things to do, have you considered
signing up as co-maintainer? You seem to know what you are doing.

Yours,
Linus Walleij

