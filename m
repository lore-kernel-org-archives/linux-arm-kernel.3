Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 564DDEF371D
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Mar 2026 08:50:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=A6g5ra2n/L6YxuER3M9hQV6Ef0cFN8mPT9klMo22ErU=; b=TywFuvD4rD4TpuK8JOGtyFsWGf
	ubshpYg8G/Uz0FO0lPOOtaj87fLPioze3YEr7f5J/zjUBmP6e/3ZUFigEm/ZQwdCXrCzDr2aqm1HL
	HeITln1rnC6O0z+j4FFA9oWVnRn7OMNoPChSeZaehfHLpU3AzHbOvgawBkFCvMDnsseMIfIv/0NMv
	E0ffy0dryjv8YRJet1HfA1tUv5h7cRqrYB+GtV+uEpbQ6BVsjthQFPXVGX5Bqid78ji0sL90hx23R
	7zy+zFjZMIcSzWrt2nFgZkGXMl/V57YLwMa+Z0FyGlWBoRgcUyEQ9lIRF2l34LBCfBAPEJh/MWdPg
	/TBUNCnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzWJX-00000006uVN-0HRd;
	Mon, 09 Mar 2026 08:50:11 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzWJU-00000006uUu-2dGg;
	Mon, 09 Mar 2026 08:50:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1773046201;
	bh=FxAl0QIkPydcsKFhFovYjX6NFk7PTnRn1mUjEL9vK3A=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=NM3yuWFhnNgYJktHRtGaEsoEEo/PYzJqlGkkh7OcNJBvXA4IVULQcBbyH3NtZWqPh
	 jpKl5L9x3F9FiKKyP4XgDcXA55+L2gL3AWaeS2bu3BAcC+WUF24DKykNnAStxwGYu0
	 7Kkchxr0NdKBMwvnmjSWaD6prqtw7bqgK0fxi3DMnrQQcRrkZ5spvEnjRMOIrVTF+w
	 lMSuwRfCJrF4fdlRnO/CRmHnKxhxjifWeHEphUHwQdI0Tkj5tLcGZ8Qh9zk1Cehc5T
	 eon+ToZ2mR4jiZAtqG/RVMNO4l49NZAVD2mQG1xgwMR7+pppeub+kox3Iwo+92qzOj
	 VmUgFiCC6TB5Q==
Received: from [10.40.0.100] (185-67-175-126.lampert.tv [185.67.175.126])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: mriesch)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 0EFDE17E01B1;
	Mon,  9 Mar 2026 09:50:01 +0100 (CET)
Message-ID: <eaec4b1c-469c-4f81-884b-3308aa85633f@collabora.com>
Date: Mon, 9 Mar 2026 09:50:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] media: dt-bindings: rockchip,rk3568-mipi-csi2: add
 rk3588 compatible
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Frank Li <Frank.li@nxp.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Kever Yang <kever.yang@rock-chips.com>,
 Collabora Kernel Team <kernel@collabora.com>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260305-rk3588-csi2rx-v1-0-0cd8d2bf28c0@collabora.com>
 <20260305-rk3588-csi2rx-v1-1-0cd8d2bf28c0@collabora.com>
 <20260307-complex-finicky-skua-bf52bd@quoll>
Content-Language: en-US
From: Michael Riesch <michael.riesch@collabora.com>
In-Reply-To: <20260307-complex-finicky-skua-bf52bd@quoll>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260309_015008_860044_AAF107EE 
X-CRM114-Status: GOOD (  16.36  )
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

Hi Krzysztof,

On 3/7/26 16:33, Krzysztof Kozlowski wrote:
> On Fri, Mar 06, 2026 at 03:09:48PM +0100, Michael Riesch wrote:
>> The RK3588 MIPI CSI-2 receivers are compatible to the ones found in
>> the RK3568. However, their integration in the respective SoC may be
>> different when it comes to the (currently not implemented) split
> 
> All this says they are compatible, so express it.

..express it... how exactly? In the commit message? Or what do you mean
exactly?

>> DPHY feature. Therefore, add the RK3588 compatible to allow for
>> future differentiation.
> 
> This I do not understand. If you just copy standard rules from
> writing-bindings, then no, don't do that. It's obvious and there is
> never a need to repeat any standard/common rule. If you want to say
> devices are not compatible, then say that explicitly.

It's a bit of a complicated story. To keep it short, the RK3568 and the
RK3588 MIPI CSI-2 receivers are compatible at least right now. In
future, this may or may not change. This depends on how this split DPHY
integration is implemented -- and we won't know that for some time.
Right now I expect that the phys property will become optional when this
happens (at least for the RK3568).

What is the safe bet here? Going for a fallback compatible and adjust
everything when the split DPHY feature is implemented?

Best regards,
Michael


