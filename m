Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63382C71136
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Jun 2025 08:25:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6bKVC5hCy0bNsFKWNhgR1dY0hHGoH2qbSKw0ik3WL+E=; b=j2dDap0j79LJk/mGIxWz2AGVQ5
	1mJYvvpxIudYI9XjGYbawbiz08Qu7X7pF6QH96SxY0TH3gBqL09kDjD4PqUpQTFnM7hGV+RHvuvaO
	/I4x69W/Is87q/ALKYbaNYDLRrH4DMrps28WynvgZnr2jQ0Bydtum4XbXeewCMIOKCnF3fn5yR/Dq
	nNT2atuMd3nt+tCir7YNRr+6VkV3zBpODKP9iNxkmyVpd4jNrcNjDYbrVLGZ37UonXl1iAR+XAJNc
	+fJr5+IrFZAFtG+i/eyaz1BPxC0B9PcIAs4MW2S7lUw5EBBeLF7v8a46ASap+Q69RlOPG7dWdV72S
	gg2mo7IQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRRcn-00000006arC-1qkw;
	Tue, 17 Jun 2025 08:24:57 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRRXv-00000006Zrc-3u0Q
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Jun 2025 08:19:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 310E3629E1;
	Tue, 17 Jun 2025 08:19:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 379C4C4CEE3;
	Tue, 17 Jun 2025 08:19:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750148394;
	bh=gxwg5xziIv+aRfRJLFFmItst7LG95nO7HUIdm7RqaTc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KOkIy1gbpvSM6i19tbNNAQUpDWergsLLSwb06WEOfpdQ3xN3afJyk2bVaXArfuXMk
	 dxSekLxizTylM2saFYQITnJV/SbPUcGJM95+iVX2sYT04S1R3Zj1LS3IvTP3ACQ/Bb
	 oiePt/x5k26XSTJxCmrjeGH9QEF2wsFYlyH2VeozUkQjQw9b8wUmdZ72IR/rePLs1C
	 Ng65cp3eFaPsOLoCJenyzYpOvOdTtJqfTkgRU+r24d4Ss8xWXNQMs7XMUZUqGlX9M7
	 ebCy9OVysIwsHPlJ4IquqynnuXicv/08g8zIkf+QQz9e/GN+hlamihKkQxbVBNN/FZ
	 82fZA/zlaN43Q==
Date: Tue, 17 Jun 2025 16:19:45 +0800
From: "Peter Chen (CIX)" <peter.chen@kernel.org>
To: Xu Yang <xu.yang_2@nxp.com>
Cc: gregkh@linuxfoundation.org, shawnguo@kernel.org, s.hauer@pengutronix.d,
	kernel@pengutronix.de, festevam@gmail.com, jun.li@nxp.com,
	linux-usb@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 0/3] implement workaround for ERR051725
Message-ID: <20250617081945.GA1716298@nchen-desktop>
References: <20250614125645.207732-1-xu.yang_2@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250614125645.207732-1-xu.yang_2@nxp.com>
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

On 25-06-14 20:56:42, Xu Yang wrote:
> Currently, the USB2.0 phy on some imx7d compliant Soc has below issue.
> 
> ERR051725:
> USB: With the USB controller configured as device mode, Clearing the RS
> bit of USBCMD register fails to cause USB device to be detached
> 
> Description
> 1. USB controller working as high speed device mode with USB gadget
>    function enabled
> 2. Cable plugged into USB host
> 3. Use case is software-controlled detach from USB device side
> 
> The expected result is device side terminations removed, increase in USB
> signal amplitude, USB host detect device is detached. But the issue is
> that the clear RS bit of USBCMD register cannot cause device detach event.
> 
> Workaround
>   - Use the below steps to detach from the host:
>       write USBCMD.RS = 0b
>       write CTRL2[7:6] = 01b
>       write CTRL2[8] = 1b
>   - As CTRL2[8] is set at detach case, so attach the steps should add clear
>     CTRL2[8]:
>       write USBCMD.RS = 1b
>       write CTRL2[8] = 0b
> 
> This will add workaround for it.

Is it imx7d specific PHY issue, since other i.mx SoCs which use chipidea
IP don't have such issue?

Peter
> 
> Xu Yang (3):
>   usb: chipidea: udc: add CI_HDRC_CONTROLLER_PULLUP_EVENT event
>   usb: chipidea: imx: add imx_usbmisc_pullup() hook
>   usb: chipidea: imx: implement workaround for ERR051725
> 
>  drivers/usb/chipidea/ci_hdrc_imx.c |  5 ++++
>  drivers/usb/chipidea/ci_hdrc_imx.h |  1 +
>  drivers/usb/chipidea/udc.c         |  5 ++++
>  drivers/usb/chipidea/usbmisc_imx.c | 39 ++++++++++++++++++++++++++++++
>  include/linux/usb/chipidea.h       |  1 +
>  5 files changed, 51 insertions(+)
> 
> -- 
> 2.34.1
> 

-- 

Best regards,
Peter

