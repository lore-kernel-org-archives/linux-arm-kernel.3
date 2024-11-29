Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5EC0D70E1A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 Nov 2024 04:15:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:Cc:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7Q5uoccyOFHjDwzni9s1pvqhXs3JznPJtn8MoISASRU=; b=d0LDnevXnoLu0wTNU2UkElq3oC
	3j3+0Eg//qNU8uXRZ9pISPF5AyyI5/C4pVOfZSMoUIEWZUf9z/yOOSnhjN2XojjX3rgGqvTArUCcD
	f1E9cKg9ejN6c37BGJNkqsNiMzFm+GUNKdFo/50yMs3lhs2HAV9V6DtCuoYpkCko4Tg9MgR/sWFHF
	u4lVQx/zXTFlDTb5blyuRROPaUwouegDYupzC8M6c0yfF7P4Gr3iIrIGGlnWNwBgiwkZWJeeC9Nk9
	na55cxkjKdt1lz0IAcC99PUzUdYRr/OAWOJdezIDGK1o1jWJyGymIxqcJEy75UoVRrYavGkoHtVUt
	qnLyBKIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGsPh-0000000GqoJ-3q7I;
	Fri, 29 Nov 2024 04:15:29 +0000
Received: from omta36.uswest2.a.cloudfilter.net ([35.89.44.35])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGsOj-0000000Gqi5-0w4Z
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 Nov 2024 04:14:30 +0000
Received: from eig-obgw-6008a.ext.cloudfilter.net ([10.0.30.227])
	by cmsmtp with ESMTPS
	id GruMt1li6qvuoGsORttcXB; Fri, 29 Nov 2024 04:14:11 +0000
Received: from md-in-79.webhostbox.net ([43.225.55.182])
	by cmsmtp with ESMTPS
	id GsONtNZcBNWjnGsOOtKzm6; Fri, 29 Nov 2024 04:14:09 +0000
X-Authority-Analysis: v=2.4 cv=dOagmvZb c=1 sm=1 tr=0 ts=67493f91
 a=LfuyaZh/8e9VOkaVZk0aRw==:117 a=kofhyyBXuK/oEhdxNjf66Q==:17
 a=IkcTkHD0fZMA:10 a=VlfZXiiP6vEA:10 a=-pn6D5nKLtMA:10
 a=a9eFdPKkdgbxhWDV1dEA:9 a=QEXdDO2ut3YA:10 a=ZCPYImcxYIQFgLOT52_G:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=linumiz.com
	; s=default; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=7Q5uoccyOFHjDwzni9s1pvqhXs3JznPJtn8MoISASRU=; b=f3ErCGcGBfb1iyOQo+fcBv1t7e
	6gIj1pftIjig6fL7tveuQjbhA03eV/QcD+R5rWTQe8Kn9b8yRm0dBILPJMeIAtcfUfaokPCf8bEQi
	VnM7TkIpwvFLSw3xj9BQhyi6Gh69ZUuRR9boclxSbWyPKx5IifgE+g3dfVaP856rdqNtazS6Wz5YF
	JpmSzV9RSZH3SLtqW7qKwH+Fxg2hykOB0b/Lml5yUanGNm9nRgIDBLwLO7zu4QpPtTIwTZsg6evED
	zsR5Vc7+gG5Tkk1K8TlzyM6VmhDxfJBgYFDuuJLK0ncSsuEditRyf0gLS4IJzvUb11IMcRspqyPew
	2Zwa/xSA==;
Received: from [122.165.245.213] (port=53154 helo=[192.168.1.5])
	by md-in-79.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <parthiban@linumiz.com>)
	id 1tGsOG-002aNG-2V;
	Fri, 29 Nov 2024 09:44:00 +0530
Message-ID: <fa7dbac4-592e-44f9-b468-834779fdbbc2@linumiz.com>
Date: Fri, 29 Nov 2024 09:43:55 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: parthiban@linumiz.com, Andre Przywara <andre.przywara@arm.com>,
 Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Samuel Holland <samuel@sholland.org>,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/sun4i: Workaround TCON TOP conflict between DE0 and
 DE1
To: John Watts <contact@jookia.org>
References: <20241108-tcon_fix-v1-1-616218cc0d5f@jookia.org>
 <20241108115357.691b77b0@donnerap.manchester.arm.com>
 <Zy4SKCBwce3q0yj5@titan> <b26b9d86-4ff9-4543-85ce-176dccfbfa05@linumiz.com>
 <Zy4c9BFcrz2JVU6k@titan> <ZzNCsFiAiACFrQhE@titan>
 <f0d5b314-cfcc-4856-8d6e-09e437c075ec@linumiz.com> <ZzPluoI7xSTwhNcm@titan>
 <2ef6afa0-2756-493b-83a4-62e73a8e2af9@linumiz.com> <ZzRgP7-hHWE8JH8K@titan>
Content-Language: en-US
From: Parthiban <parthiban@linumiz.com>
Organization: Linumiz
In-Reply-To: <ZzRgP7-hHWE8JH8K@titan>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - md-in-79.webhostbox.net
X-AntiAbuse: Original Domain - lists.infradead.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - linumiz.com
X-BWhitelist: no
X-Source-IP: 122.165.245.213
X-Source-L: No
X-Exim-ID: 1tGsOG-002aNG-2V
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: ([192.168.1.5]) [122.165.245.213]:53154
X-Source-Auth: parthiban@linumiz.com
X-Email-Count: 3
X-Org: HG=dishared_whb_net_legacy;ORG=directi;
X-Source-Cap: bGludW1jbWM7aG9zdGdhdG9yO21kLWluLTc5LndlYmhvc3Rib3gubmV0
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfLqsGSjw5egsgoGk+qB/UySeOkcTDBwWzCowcRvo79psmpCdHSLHXXDWxKlrgj+SJGgRBHzWhB0Ml/YQyRIkHrcg6lMepMoTRzI78wPxtrKvuTSSIFO9
 kpeSuep7QfX/bNYU8u2BeWz3/n/nl/N72H4WvxtJed95imqBm5+YDM6CcXAGREEfpO1LYF2kcIrWlnXHBeJA177FlNEo/r19e0gsLimfGC03u5dpjh6g84sR
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241128_201429_279557_1955BC4B 
X-CRM114-Status: UNSURE (   5.55  )
X-CRM114-Notice: Please train this message.
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

On 11/13/24 1:45 PM, John Watts wrote:
> It really seems like the code means mixers here.
True, I was wrong about my statement. But with A133, the case of independent DE
is unique, which I couldn't test yet.

> If my thoughts are correct, this would break use of mixer0 and mixer1 at the
> same time.
Agreed. But back to the original discussion about setting 0x20 to the port
register, it work fine in my end without that changes for A133 display pipeline
with LVDS. Not sure if the reason is independent DE.

Thanks,
Parthiban

