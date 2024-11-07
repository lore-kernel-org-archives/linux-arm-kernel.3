Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21C6DD5AE60
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 Nov 2024 05:15:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=koTQ6hfT5fyI87ugo8rs9BX65rNb6aDCCXL057hSGYI=; b=F3X/EPuZrr5aV5oHU1mWBeM8oA
	EWW7e008UBLqOFpONx+vEV9pIfH7sTlyW0dWwR78lz/EhWf3vq5eGELVTH0XS99g/fA+sMlYYLYCF
	W2yr3sY56UT+F3JHcgsR/2k1kxTAF/RFMxQoqHEoy9qEN2Y3rrWnqLGQ/ul8pd89HOghkly/zxeiq
	BxevX4wtDmjNtSd1c1/63NOaJRPmOrX151ChOWEr8SvYFcr0EUkqyeGwIsvfANA5Wpv/ILYsu4rYe
	ZdUDdOByXEEn4kgtKEJVJYU+YIBv7FDfplzDJQQJabE+++fRzeYNnKsPpx723XL+r2m2iUhZenDt0
	yQ66hmqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8urs-00000005gqW-0oPV;
	Thu, 07 Nov 2024 05:15:40 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8uq9-00000005gaX-0aiX;
	Thu, 07 Nov 2024 05:13:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id CE58BA4216B;
	Thu,  7 Nov 2024 05:11:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB757C4CECC;
	Thu,  7 Nov 2024 05:13:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1730956431;
	bh=XU5d9EvYNAXm7syZXOkrkzihF12wfuon3QHGq0L5hjE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OJQiW6TbRLQTAUf/tFxceEc5Fq13cvElbCVuIPf4YGliOYyFlGGoRo+CVjFVbbutx
	 6pg58vCsg06SZM0wXGQU6JjpR9F011lGD1d6nVhKjC/jVyPpHqrWWu7WxJLYWN6u8v
	 fZsa4dNddcFBEKpP+D1OHlsn8CTCb+a3wL6s6QR0=
Date: Thu, 7 Nov 2024 06:13:32 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: "Haowei Cheng(Harvey)" <harvey.cheng@fibocom.com>
Cc: "chunfeng.yun@mediatek.com" <chunfeng.yun@mediatek.com>,
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: =?utf-8?B?5Zue5aSN?= =?utf-8?Q?=3A?=
 0001-usb-mtu3-fix-panic-in-mtu3_gadget_wakeup.patch
Message-ID: <2024110735-entertain-parish-7b45@gregkh>
References: <SEZPR02MB54953820B2A9EEBD807D0ED18E512@SEZPR02MB5495.apcprd02.prod.outlook.com>
 <2024110512-popcorn-germless-01be@gregkh>
 <SEZPR02MB5495A8637098B92CDEBBFC6C8E532@SEZPR02MB5495.apcprd02.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <SEZPR02MB5495A8637098B92CDEBBFC6C8E532@SEZPR02MB5495.apcprd02.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241106_211353_265239_082F3A68 
X-CRM114-Status: GOOD (  10.58  )
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

On Wed, Nov 06, 2024 at 07:39:59PM +0000, Haowei Cheng(Harvey) wrote:
> Hi greg k-h，
> 
> We found during development that when there are data packets to be sent on the USB RNDIS network card,
>  unplugging the USB cable will trigger a certain probability of system warning or panic.
> We observed that the mtu3_gadget_wakeup function uses the usleep_range_state function,
> which has certain scenario limitations. Therefore, we made this optimization.

Please do not top-post :(

Just resend your patch properly, in a format that we can apply it in,
and we will be glad to review and discuss it that way.

Look for thousands of examples on the lists for how to do this, as well
as the documentation in the kernel tree itself which explains this in
way-too-much detail.

thanks,

greg k-h

