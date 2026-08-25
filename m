Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6EE4C61DB9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Aug 2026 21:06:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mXPE1zcGo976EzGHDXx5Ar7VnZP3PdhjhoOGWAuejoE=; b=p4wAMbBnOujzMLlXeWZIOB/tvJ
	0MlkXc8pkSIRs//Kzepm4MbvmU13iCi7GD8ao7fzoe0djmMoH0mX6o59nKq7oGoOHpVUMfNDjE6S+
	P7rxAuAmFc8/eHxf56LHmN7ztfvYvwiwRabwxuAj+xOXngItDP4QtIWWj0MWXRxAOmM8Cwr3b9Sqg
	K/0RgRpfsyWXUVIC3AL8CRQci1svO+USV5dYei2NGpO+H417FDvRA3Em+pmI4Ag2hasI9eCUVcYxr
	2K7hwNi79mCFZFKFWPm1fXbqfNhBpG1xzkCvSm842nFejQ0Z64VXYtTx+MxVpfNcaUmk2Bu9mh8z2
	+NpE07GQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyyLS-00000001Tyu-42J3;
	Tue, 25 Aug 2026 21:06:10 +0000
Received: from smtp.forwardemail.net ([149.28.215.223])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyyLQ-00000001TyX-3qwV
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Aug 2026 21:06:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lineageos.org;
 h=Content-Transfer-Encoding: Content-Type: In-Reply-To: From: References:
 Cc: To: Subject: MIME-Version: Date: Message-ID; q=dns/txt;
 s=fe-2eefaa527c; t=1787691967;
 bh=mXPE1zcGo976EzGHDXx5Ar7VnZP3PdhjhoOGWAuejoE=;
 b=DSQOrOLDqyXuBLtYTU76CByocWFEvOaHKDTtS3uZEVSvss4pzHxOoy4vifXyLtuwmIwHYsF30
 HZisROCXVUaGY5aFRaRUSdW3kCYiemkUToey9/CZhOU74kO2rtsDTIQV8xcMUYWneEK0WXopC+O
 0vWGuJKMaFSeXuVDbx+i4F8=
X-Forward-Email-ID: 6a8e03b750593cdd5fd1e5f7
X-Forward-Email-Sender: rfc822; tturner@lineageos.org,
 smtp.forwardemail.net, 149.28.215.223
X-Forward-Email-Version: 2.13.16
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
Message-ID: <135d48e7-58ac-48b8-8fa5-c2548e2f3ae9@lineageos.org>
Date: Tue, 25 Aug 2026 22:05:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re:
To: Sam Protsenko <semen.protsenko@linaro.org>,
 Alexey Klimov <alexey.klimov@linaro.org>
Cc: "robh@kernel.org" <robh@kernel.org>,
 "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>,
 krzysztof.kozlowski@oss.qualcomm.com, peter.griffin@linaro.org,
 alim.akhtar@samsung.com, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org
References: <GVYP280MB12139AB976CA7ACF49FEB768A1A52@GVYP280MB1213.SWEP280.PROD.OUTLOOK.COM>
 <CAPLW+4kQTUX8QhKnAP7bg=iCw5hhNQZoW7cuOpTdvvAUpGaicg@mail.gmail.com>
Content-Language: en-GB
From: Thomas Turner <tturner@lineageos.org>
In-Reply-To: <CAPLW+4kQTUX8QhKnAP7bg=iCw5hhNQZoW7cuOpTdvvAUpGaicg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260825_140609_110773_29051FE2 
X-CRM114-Status: GOOD (  14.04  )
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

Hi Sam and Alexey,

On 19/08/2026 20:51, Sam Protsenko wrote:
> Can you please tell us a bit about how you tested this patch, and on
> which board? As DPU is not currently enabled on Exynos850 SoC, I'm not
> sure how exactly GPU can be useful. If you have a use case or a
> testing procedure we can run on the E850-96 board, please share.
> 

Sam, Alexey could you please test GPU on the E850-96 board by following
these instructions:

1) Apply this patch series locally
2) Change status="disabled"; to status="okay";
3) Make sure these configs are enabled:
CONFIG_DRM_SIMPLEDRM=y
CONFIG_DRM_PANFROST=y
4) In terms of regulators we set up a basic mali regulator via our
secondary bootloader [1] and configured with this dts setup [2], NOTE
you may be able to get away with a dummy regulator so try that first.
If not I am sure you can replicate something simple with u-boot PMIC.
5) Boot a GUI, I saw Debian was used for the bring-up, that should work
6) Run the following command:
$ dmesg | grep "panfrost"
7) Compare that to the output at [3]

I hope these instructions make sense, but feel free to send any queries
my way.

Best Regards,
Tom

[1] https://github.com/samsungexynos850/uniLoader/commit/6a2ed2d97aaf1616e581d0979f9e56a046093e15
[2] https://github.com/samsungexynos850/linux/commit/68442271304b7c7a410d85118e85df67bcda108a
[3] https://gist.github.com/DaemonMCR/63fa564483202642d6d66e628b8e6c90

