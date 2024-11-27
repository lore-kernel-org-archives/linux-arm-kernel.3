Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EE67D609D5
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 Nov 2024 11:09:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GgVLM+pxB0mTT4Xgy0u5pynEp9OkHXXnOP4d8il9bhA=; b=mpj+fpE32kOcd0hn7TE7+ePpmt
	mNjd5lur3eQIP15dU5F4w8CyCCI0OXsD8YUX00X0qC9nn6Jds4jfDLyKleI4B6ommtB8i8oeSe5T0
	70m/4g7iBzFskvHOa6OkAcGxcA9t3GS6tvIm7KaHwNQo9LVSSiOg7zhhMGeLtYC0n+OSJjtPhagDS
	+8XmX+LaDoub9s7zsQgjCqNYdKRmgo6yQbuFSRng0vciyC5oOTWF27ksxISqypJ6HsWq9WOPcI8vM
	SsHHnv38IZjVM61Dwx2QzVXKXXDrEepJENFHcjcmO4NPJ4pz4X3p0MWbqYBwRB/XSBJzyM0Fwi9vI
	7d7vyvKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGFuo-0000000CxNn-2uWm;
	Wed, 27 Nov 2024 11:09:02 +0000
Received: from mail-m49194.qiye.163.com ([45.254.49.194])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGFmO-0000000Cvgj-15xH;
	Wed, 27 Nov 2024 11:00:22 +0000
Received: from [172.16.12.26] (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 3fe683f3;
	Wed, 27 Nov 2024 19:00:10 +0800 (GMT+08:00)
Message-ID: <8df0acc8-b7aa-453f-b55c-30144f51d7cf@rock-chips.com>
Date: Wed, 27 Nov 2024 19:00:10 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 04/10] phy: phy-rockchip-samsung-hdptx: Add support for
 eDP mode
To: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 rfoss@kernel.org, vkoul@kernel.org, sebastian.reichel@collabora.com,
 cristian.ciocaltea@collabora.com, l.stach@pengutronix.de,
 andy.yan@rock-chips.com, hjc@rock-chips.com, algea.cao@rock-chips.com,
 kever.yang@rock-chips.com, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org
References: <20241127075157.856029-1-damon.ding@rock-chips.com>
 <20241127075157.856029-5-damon.ding@rock-chips.com>
 <4260470.1IzOArtZ34@diego>
Content-Language: en-US
From: Damon Ding <damon.ding@rock-chips.com>
In-Reply-To: <4260470.1IzOArtZ34@diego>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZQxgZQ1ZIQ0tCTx0ZHxlDHR5WFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSUhCSE
	NVSktLVUpCS0tZBg++
X-HM-Tid: 0a936d4752a703a3kunm3fe683f3
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6NRA6Lgw5CDIpHS5NEwE3NhMU
	ChYaCh9VSlVKTEhJTEtOSUpJTENMVTMWGhIXVR8aFhQVVR8SFRw7CRQYEFYYExILCFUYFBZFWVdZ
	EgtZQVlOQ1VJSVVMVUpKT1lXWQgBWUFJSUNPNwY+
DKIM-Signature: a=rsa-sha256;
	b=MHKppqx3/69QuoNhREUlt7wo6qUNbztr929L0BnEn2+9UfVCaFP8Pa0GA4fZZ92lKe+e0VQmieBZpCBg75bzcV0dR7PpPw1l8coEQLKAFbFB7lTzqcHTw1KeCKSnVxEtDGd6zJvbgLCQtA1pTrUMzV+fyCIcN/UadJcRfpp7tzA=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=GgVLM+pxB0mTT4Xgy0u5pynEp9OkHXXnOP4d8il9bhA=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241127_030020_792847_D0BDFA5C 
X-CRM114-Status: GOOD (  22.31  )
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

Hi Heiko:

On 2024/11/27 17:29, Heiko Stübner wrote:
> Hi Damon,
> 
> Am Mittwoch, 27. November 2024, 08:51:51 CET schrieb Damon Ding:
>> Add basic support for RBR/HBR/HBR2 link rates, and the voltage swing and
>> pre-emphasis configurations of each link rate have been verified according
>> to the eDP 1.3 requirements.
>>
>> Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
>> ---
> 
> [ ... huge block of DP phy support ...]
> 
> yes that block was huge, but I also don't see a way to split that up in a
> useful way, so it should be fine.
> 

As for the huge block of DP phy support, I will try to use the existing 
rk_hdptx_multi_reg_write() to set regs in next version, maybe the way 
can make the codes more concise.

> 
>> +static int rk_hdptx_phy_set_mode(struct phy *phy, enum phy_mode mode,
>> +				 int submode)
>> +{
>> +	return 0;
>> +}
> 
> I think it might make sense to go the same way as the DCPHY and also
> naneng combophy, to use #phy-cells = 1 to select the phy-mode via DT .
> 
> See [0] for Sebastians initial suggestion regarding the DC-PHY.
> The naneng combophy already uses that scheme of mode-selection too.
> 
> There is of course the issue of backwards-compatibility, but that can be
> worked around in the binding with something like:
> 
>   '#phy-cells':
>      enum: [0, 1]
>      description: |
>        If #phy-cells is 0, PHY mode is set to PHY_TYPE_HDMI
>        If #phy-cells is 1 mode is set in the PHY cells. Supported modes are:
>          - PHY_TYPE_HDMI
>          - PHY_TYPE_DP
>        See include/dt-bindings/phy/phy.h for constants.
> 
> PHY_TYPE_HDMI needs to be added to include/dt-bindings/phy/phy.h
> but PHY_TYPE_DP is already there.
> 
> That way we would standardize on one form of accessing phy-types
> on rk3588 :-) .
> 
> Also see the Mediatek CSI rx phy doing this too already [1]
> 
> 
> Heiko
> 
> [0] https://lore.kernel.org/linux-rockchip/udad4qf3o7kt45nuz6gxsvsmprh4rnyfxfogopmih6ucznizih@7oj2jrnlfonz/
> [1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/devicetree/bindings/phy/mediatek,mt8365-csi-rx.yaml
> 

It is really a nice way to separate HDMI and DP modes.

> 
> 
> 
> 

Best regards,
Damon


