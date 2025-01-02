Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8FF9E77188
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jan 2025 16:59:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dRM7LIJF9jh6lqB+/i8HwabrDShaWCLC/iAJxa/ormM=; b=huoTYsEuY+ztmufM53D/yJ5Ffa
	h6n4UPoI6gPlIk6vwi+FHW0Vd0cX7+oGbcB21a53R6jfjHtD++rBlvgFUIvLum1APE6yS2bx1njUv
	BhOGK8oq7m4wxDWNYvwKWz2BEnTlOL5PuxlaArr3YxUmPUv9MLRX8eij1ZZHWDZUNmlyR7Zfwc8qD
	uWOQWOa94ycy9uCLc3BWt8eYMQejRH7jLpsgnRwVAzpco34NFB4k1UfdL5D9S/MDXjsXvBoAPczNl
	3/F0DWDoYXeNIwrHYMlkrEj4+gh5ybtRxK/VftNRxUt0cP0vujHehCnY7BRwtrzu92cwbdT12X1PS
	t8Hft56Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tTOXA-0000000AupB-3h6P;
	Thu, 02 Jan 2025 16:58:56 +0000
Received: from smtp.forwardemail.net ([149.28.215.223])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tTOVx-0000000Aufw-0SXl
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Jan 2025 16:57:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: Content-Type: In-Reply-To: From: References:
 Cc: To: Subject: MIME-Version: Date: Message-ID; q=dns/txt;
 s=fe-e1b5cab7be; t=1735837059;
 bh=dRM7LIJF9jh6lqB+/i8HwabrDShaWCLC/iAJxa/ormM=;
 b=Wo3rZ0ec2mVd74Il9cInd3Cf4V6NvwiTYNtBLRNXMN3rHBINY7s7aHktC3qaT8EerRWupPGSP
 cVrYh0TFN9fwfx6IRl+8locMVymnFSBU96cOcvY9YXUKGanmqYnDiqrfUrfHn2bbOtUR49cqAM/
 wsO5vDcGQzGICbG+u+YQCEmZl7mW4kRz0LoC3Dm6xlf2Fi7MvAffn8MEaJnvBGh4f7bL83nmEUd
 5EFhi6CS4d3Su1BTOSVjswWwaaB/BIBv4zYTKaXnqb/1o3MD+XTA/gvHQhw0X2pTAoJpHOXgmtW
 dKgOP8CS7SjTCnTqVPvDKx4bexOJs0lhannw3ZmzdVmA==
X-ForwardEmail-Version: 0.4.40
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
Received: from [192.168.2.234] ([78.69.151.207]
 78-69-151-207-no600.tbcn.telia.com) by smtp.forwardemail.net (Forward
 Email) with ESMTPSA (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384); Thu,
 02 Jan 2025 16:57:19 +0000
Message-ID: <688c8fb6-68f7-45f1-98fc-8b3252b3ecbf@kwiboo.se>
Date: Thu, 2 Jan 2025 17:57:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: (subset) [PATCH 1/2] arm64: dts: rockchip: rk3568: add
 reset-names for combphy
To: Jianfeng Liu <liujianfeng1994@gmail.com>, vkoul@kernel.org
Cc: amadeus@jmu.edu.cn, conor+dt@kernel.org, devicetree@vger.kernel.org,
 heiko@sntech.de, kishon@kernel.org, krzk+dt@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org,
 linux-rockchip@lists.infradead.org, p.zabel@pengutronix.de, robh@kernel.org,
 yifeng.zhao@rock-chips.com
References: <173367712869.1031947.3262464465649332012.b4-ty@kernel.org>
 <20250102151601.2615178-1-liujianfeng1994@gmail.com>
Content-Language: en-US
From: Jonas Karlman <jonas@kwiboo.se>
In-Reply-To: <20250102151601.2615178-1-liujianfeng1994@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ForwardEmail-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 149.28.215.223
X-ForwardEmail-ID: 6776c574758981c18e6f13ec
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250102_085741_495225_89A14BC6 
X-CRM114-Status: GOOD (  10.23  )
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

On 2025-01-02 16:16, Jianfeng Liu wrote:
> Hi,
> 
> On Sun, 08 Dec 2024 22:28:48 +0530, Vinod Koul wrote:
>> Applied, thanks!
>>
>> [2/2] phy: rockchip: naneng-combphy: fix phy reset
>>      commit: fbcbffbac994aca1264e3c14da96ac9bfd90466e
> 
> The other patch in this series:
> arm64: dts: rockchip: rk3568: add reset-names for combphy
> is missing in v6.13-rc5, which will break pcie2 of rk3568 because the phy
> driver has changed.

Yes, the commit fbcbffbac994 ("phy: rockchip: naneng-combphy: fix phy
reset") breaks backward compatibility with existing DTs and this commit
should probably be reverted or driver need a fix that fall back to old
behavior in case DT is missing reset-names.

Regards,
Jonas

> 
> Best regards,
> Jianfeng
> 


