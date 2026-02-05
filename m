Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB7B4E91288
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Feb 2026 07:25:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Hk2FM+f8l5QrYyPbtUH9yZtELqXLs48+0tAxMfQcvO8=; b=VvTuGjudKfi1yKRrnRKmYoqrCr
	SKDI9pZEgb46jtIofpmzgv1v/qJa9GFLD/kCZ3SHUthNjV6cNQyhS+rQCvqrhsMgYIvqKEH7haEoh
	w8anDXFc85HtS7rxDrS/SdJq1B39tYOmc5bQdUCkc/dvIu7RJhSTRc+4FDuEiXv4HZ6QEhynXvhJY
	UVJRipVMYvtuz24aLPK5HtFTamQNh/bVovsK7Knl5h0Megv+mUyr0thgfD40lLev05V8G9gtfyIwM
	ysWSIh2iSeyyZygwugxBHuP9BMquSrt8l/ebiVisF0SOSCB75Kp42eSBcXL6XEnL735QeHzwZH+LD
	mGLEdBRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vntjU-00000009Y1h-0sQx;
	Thu, 05 Feb 2026 07:24:56 +0000
Received: from mail11.truemail.it ([217.194.8.81])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vntjP-00000009Y17-3eo1
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Feb 2026 07:24:54 +0000
Received: from francesco-nb (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id 520FD1FAD1;
	Thu,  5 Feb 2026 08:24:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1770276284;
	bh=Hk2FM+f8l5QrYyPbtUH9yZtELqXLs48+0tAxMfQcvO8=; h=From:To:Subject;
	b=mHZXC9FOE9e7sWUjqd/61SX7F4M/OXDh8/ht7ZFS3317o1T/147F5uWo5nV7lOPBO
	 Ye13Gws237zW1TOcOV70SRdEIl1mMnMOpnE8EfuOY3EI0KYH79MzhGBrqz+/1jcIKI
	 DkzeC1Z1GvIaxTU4MJWUvXuTDQiRoh2Laj/bXaJVQoTvCnt9UbzHWlSRYl00EygIt4
	 +eH6gTHBSABvNlEz1BS/7SVY/8Kq/7Jj2WhXf3JOYE1r6ksFKYhS7l2IcV164rQ7cU
	 Chvq1+s3D7wn/ipQhHbdspJLeHBgHnr/mn/kkTbqM/06u93ked99LPOg4KI0y5wZMC
	 LKjDP/oD46yWw==
Date: Thu, 5 Feb 2026 08:24:39 +0100
From: Francesco Dolcini <francesco@dolcini.it>
To: Judith Mendez <jm@ti.com>, Vitor Soares <ivitro@gmail.com>
Cc: Markus Schneider-Pargmann <msp@baylibre.com>,
	Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Vishal Mahaveer <vishalm@ti.com>,
	Kevin Hilman <khilman@baylibre.com>, Dhruva Gole <d-gole@ti.com>,
	Sebin Francis <sebin.francis@ti.com>,
	Kendall Willis <k-willis@ti.com>, Akashdeep Kaur <a-kaur@ti.com>,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>, linux-kernel@vger.kernel.org,
	Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>
Subject: Re: [PATCH] arm64: dts: ti: k3-am62a7-sk: Disable mmc Schmitt Trigger
Message-ID: <20260205072439.GA4548@francesco-nb>
References: <20260106-topic-am62a-mmc-pinctrl-v6-19-next-v1-1-1190ac29aadb@baylibre.com>
 <c47697b4-6ebb-4af9-be96-c964d990835d@ti.com>
 <DFO764ES0FNP.1SUQK9R0EUUDQ@baylibre.com>
 <1a91fd40-e814-4b4c-8914-d8f0c4768e07@ti.com>
 <DG59D7WGM35A.1WNIIMNCQ8U3C@baylibre.com>
 <7ae7f6a1-0ee1-4d56-b1d0-f038a7d22b4c@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7ae7f6a1-0ee1-4d56-b1d0-f038a7d22b4c@ti.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260204_232452_943768_C0C85D54 
X-CRM114-Status: GOOD (  37.18  )
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

Hello Judith,

On Wed, Feb 04, 2026 at 08:03:39PM -0600, Judith Mendez wrote:
> On 2/3/26 4:35 AM, Markus Schneider-Pargmann wrote:
> > On Wed Jan 14, 2026 at 11:04 PM CET, Judith Mendez wrote:
> > > On 1/14/26 3:16 AM, Markus Schneider-Pargmann wrote:
> > > > On Tue Jan 13, 2026 at 1:29 AM CET, Judith Mendez wrote:
> > > > > On 1/6/26 10:22 AM, Markus Schneider-Pargmann (TI.com) wrote:
> > > > > > Remove Schmitt Trigger from mmc pins. With Schmitt Trigger enabled
> > > > > > u-boot SPL is not able to read u-boot from mmc:
> > > > > > 
> > > > > >        Trying to boot from MMC2
> > > > > >        Error reading cluster
> > > > > >        spl_load_image_fat: error reading image u-boot.img, err - -22
> > > > > >        Error: -22
> > > > > >        SPL: Unsupported Boot Device!
> > > > > >        SPL: failed to boot from all boot devices
> > > > > >        ### ERROR ### Please RESET the board ###
> > > > > > 
> > > > > > I bisected this issue between u-boot v2025.10 and v2026.01 and found the
> > > > > > devicetree merge to be the problem. At a closer look I found the
> > > > > > k3-pinctrl.h changes. Disabling the Schmitt Trigger fixes the u-boot SPL
> > > > > > failure to read from mmc.
> > > > > 
> > > > > I have tested 4 AM62A SK boards and I cannot replicate the issue
> > > > > you are seeing. I do not see an issue with Schmitt Trigger in U-boot
> > > > > nor Linux /:
> > > > 
> > > > Thanks for testing.
> > > > 
> > > > > Can you please run a quick tap sweep on MMC1 and MMC0 interfaces like
> > > > > so? https://gist.github.com/jmenti/f4a73a8323e44bf717c6d2c528c499ca
> > > > > 
> > > > > This will give me an idea if whether we should be talking about
> > > > > revisiting characterization with ST_ENA=1.
> > > > 
> > > > The patch was a bit broken, but I think I managed to apply it to
> > > > v2026.01 as it was supposed to be. (master currently doesn't boot even
> > > > SPL, I don't have time right now to debug that).
> > > 
> > > as Nishanth, mentioned, master is missing two patches [0][1]
> > > 
> > > > 
> > > > I attached the boot log. It does boot with your patch. Also can this be
> > > > an issue with different SD cards?
> > > 
> > > Something does not quite add up,
> > > 
> > > Can you try the following 2 commands?
> > > 
> > > # mmc dev 1
> > > # md.w 0xfa0810c
> > 
> > Finally here is the output from boot and executing these commands. I am
> > now on v2026.04-rc1 with your sweep patch.
> 
> Thanks for sending over the tap sweep. I compiled a comparison table
> here to show a bit of data for the u-boot tuning step:
> https://gist.github.com/jmenti/5d42f1e43fb357083eaa813cfee484a8
> 
> Based on the data I can conclude the following:
> 1. you seem to have more errors than I do
> 2. there seems to be an issue with the chosen final tap setting
> 3. the chosen final tap setting should still have worked for you
> but did not.
> 
> For #2, something in the tuning results seems off so let me investigate
> this on my end and Ill get back.
> For #3, will have to discuss this internally & test a couple more things,
> then come back with more information.
> 
> Meanwhile, I am interested to see what are the tap sweep results for the
> failing Verdin board, if those can be sent as well, that would be great
> info.

Verdin is now booting fine. The boot failure was related to other U-Boot
bugs (as Nishanth mentioned) that are now fixed.

Thanks
Francesco


