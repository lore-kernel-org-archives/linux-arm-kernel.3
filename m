Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3A761099B30
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Mar 2026 21:24:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jAQDQ2Ijn2JafmoVVhu9OwhIlf/ITjKAIPoy10A798Y=; b=pl9vo3bSSXBEjMSrEute/iyQp1
	Pt4ZC1QsKpxaQ5lR6QaX/lq082HPGsc+9alcyIw1JEgnpyWXB5WoPrkzgSjG+JLtG9QgrqFH1oGrR
	RocluV7ZSYTHPXChD63GVR+aXtw0BepNTFKfAwlKpnzbgjrY46nyPQa5LDvoFeUqV52nuX/E2FPwt
	le8vbQJ6rycQwBGZiLUmpeudGALZiC8J26Fz/LoLjzNeJ3yWdk2PF/an/Quq5TMpwJTTu+zVUUQRJ
	RRSdg5vTHbA1LimTCWQzP/Q0Snj/EQpJaD50JPVILi1EZC0XXzCxvb6Hhy3AxmoEkVm0Z8siJdyCL
	85av5k2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3hK7-0000000DcVX-1FbZ;
	Fri, 20 Mar 2026 21:24:03 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3hK6-0000000DcVQ-18VG
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 20 Mar 2026 21:24:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=jAQDQ2Ijn2JafmoVVhu9OwhIlf/ITjKAIPoy10A798Y=; b=gvySCkfG7KTbQFQYuzA/3suteH
	Zq68jJLBCbqZW6nb1TEEvHGaWl5013TDpAk6GmIMZopUEuCIS6Egat3PFuxUYCeAiFLDbpjp8sMpy
	fM/ltZdgRNAqXkDK/p1Xw1rz7xyZoSVHGPevC8+1hj/36+Aem5qEqUrz4jTK6DlYawSWXSTVbzeWd
	uz/qzN2NCRiMl3R50+AlHoeRC7a0wSF9ioURNkbXtRhTEdWxrureNCQzTI6KhGIk7dWGJzYavOTCo
	OY1jogCjtCUvle9xj1ZbFZl5regfkuAtnmV8lHwhZTkATYvKZqjFKvC76Tz7OsNwn0KLnA7JD5wGN
	DMtsPaNg==;
Received: from zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
	by casper.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3hK2-00000008OXV-3uk5
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Mar 2026 21:24:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=jAQD
	Q2Ijn2JafmoVVhu9OwhIlf/ITjKAIPoy10A798Y=; b=L8Fp4irv4LycvmIlOZ3f
	WUViDiZxJrvz9m7VzpNUdk3cGXX0Aeo61n8EJTCw0K9+d4I/PGRtkPig7GSaosp7
	bgCmcWipGxQUCT61C2BVKByrJpsvoyQJybJFDLrHrFcLUNYrBeldQUxr7vS4E8Io
	ZMjTN6EKxsAC2rIo4e1LljfH8CFRnthH8/r0fy6OTvUxV0PYxA3dNYXY+mRTrCrD
	P47+wuBlLfRS7EjA7UzMZJvbX1rs/j5hoFr8G0GP51EuX/irog4Dh5BtP6aW2HR2
	WZ62n6T/enlZrq/cuxNwPlea9aiK2HPz3Cengtv1RPKmWK1wN4xsWoZ5kH7ybTLN
	Ag==
Received: (qmail 1700375 invoked from network); 20 Mar 2026 22:23:53 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 20 Mar 2026 22:23:53 +0100
X-UD-Smtp-Session: l3s3148p1@2XBHTXtNHLEujnsL
Date: Fri, 20 Mar 2026 22:23:52 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Cc: Loic Poulain <loic.poulain@oss.qualcomm.com>,
	Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.Li@nxp.com>,
	linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v6 1/5] dt-bindings: i2c: qcom-cci: Document sm6150
 compatible
Message-ID: <ab266KF-8ll2TKxm@shikoro>
References: <20260305-sm6150_evk-v6-0-38ce4360d5e0@oss.qualcomm.com>
 <20260305-sm6150_evk-v6-1-38ce4360d5e0@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260305-sm6150_evk-v6-1-38ce4360d5e0@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260320_212359_050282_265AF764 
X-CRM114-Status: UNSURE (   5.96  )
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

On Thu, Mar 05, 2026 at 05:48:12PM +0800, Wenmeng Liu wrote:
> Add the sm6150 CCI device string compatible.
> 
> Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> Acked-by: Andi Shyti <andi.shyti@kernel.org>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>

Applied to for-next, thanks!


