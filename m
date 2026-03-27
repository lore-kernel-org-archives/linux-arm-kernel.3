Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D28210ED66E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Mar 2026 12:52:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Pd3XpOGpsUr4IAEh5acArmMZ3OWlOZdC/75L5xOD3gw=; b=c2H5zkC2oz74JqBzfscnoWcWis
	jSWbtOcl4Ivyp8z5+p6+3P8gXlhk1cPJxmC2d7d3Ipshsd7lUDX00+6XT2PGOszcbnEcT86OkKSnO
	hsWK2aLMCdPaRzq7/oDbPDbwllY7AoqUiFeGV6t54J3EJm+zryo3ZYn+Xq2ELIEuNnfWrpOyntX44
	4gVTwsqeR0YSaypkLF1NEqgdFn8DcsxI3DIfbK58Q1+2JSUHjaOg6JXKcqEoMH8JCyiNVIdHVvx7w
	rzHggvPidNsVolsQXG9xowaiSoE22lFgAWZwrtrpRFwPiz1gf/qbyMzdLuC+E/vkyH0AKSpcIMpck
	shSq8LDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w66fH-00000007N0U-1ruE;
	Fri, 27 Mar 2026 12:51:51 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w66fE-00000007MzW-303h;
	Fri, 27 Mar 2026 12:51:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1774615904;
	bh=+CLD7N/xs5jrp+gBJvL7KeuM5R0Wm9A5tOiDhEWnQiQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=GrVG6KQ3t5hCut9XXlE4yEKNlD9EE7f2zXD8SXKt5k1CyGL4BKYGEftfjbOXj2Pqf
	 etbaQ07g2cCAjT7HqbxY+GBTx+16RHZQwQWH99vA8e0TE9HgT7PGi1mYI/1HI1EeO8
	 9k6jfrkwEopTQMUa4rRszityVb+SpSXJfXDKyDLcYfThtc6D8kCC2rF9eOweFXKWj7
	 n7xJIUAowB1mVJ8Nz14xx0T2UPyyEMGv7rrjJ5+NktKraudt+ll0LX3yO5UDFsZyp3
	 9pE7Ija3/997BqehoBNexfTvyXyUZEEVBO9RX6ZHkm1EOPak/Ca6+34ohCx3syNiID
	 40u7HH5rG8lig==
Received: from [192.168.1.90] (unknown [86.123.23.225])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id B9C4F17E5A72;
	Fri, 27 Mar 2026 13:51:43 +0100 (CET)
Message-ID: <87f08459-740e-4fbf-b933-110182bc8918@collabora.com>
Date: Fri, 27 Mar 2026 14:51:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 0/4] arm64: dts: rockchip: Fix vdec register blocks
 order on RK3576/RK3588
To: Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Detlev Casanova <detlev.casanova@collabora.com>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 Hans Verkuil <hverkuil@kernel.org>
Cc: kernel@collabora.com, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>,
 linux-media@vger.kernel.org, Conor Dooley <conor@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
References: <20260304-vdec-reg-order-rk3576-v5-0-7006fad42c3a@collabora.com>
 <4358847.1IzOArtZ34@phil>
Content-Language: en-US
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
In-Reply-To: <4358847.1IzOArtZ34@phil>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260327_055148_921074_14BFFF74 
X-CRM114-Status: UNSURE (   8.59  )
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

On 3/10/26 10:44 AM, Heiko Stuebner wrote:
> Am Mittwoch, 4. März 2026, 22:00:39 Mitteleuropäische Normalzeit schrieb Cristian Ciocaltea:
>> When building device trees for the RK3576 based boards, DTC shows the
>> following complaint:
>>
>>   rk3576.dtsi:1282.30-1304.5: Warning (simple_bus_reg): /soc/video-codec@27b00000: simple-bus unit address format error, expected "27b00100"
> 
> [...]
> 
>> Cristian Ciocaltea (4):
>>       media: dt-bindings: rockchip,vdec: Mark reg-names required for RK35{76,88}
>>       media: dt-bindings: rockchip,vdec: Add alternative reg-names order for RK35{76,88}
> 
> due to media "applied" messages most of the time not reaching all Cc'ed
> recipients, please tell me once the binding patches landed somewhere.

Yeah, sadly I also haven't received any notification so far, but just noticed
the binding patches are now in next-20260326, as a result of merging branch
'next' of https://git.linuxtv.org/media-ci/media-pending.git:

a11db8d8b403 ("media: dt-bindings: rockchip,vdec: Mark reg-names required for RK35{76,88}")
35c8178ed2bd ("media: dt-bindings: rockchip,vdec: Add alternative reg-names order for RK35{76,88}")

Thanks,
Cristian

