Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17B92CA101F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Sep 2025 05:48:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fiqmWGsdCg8mUQGHU8Ptr2/I+sz+nNIVA50SIDGFEnE=; b=a4EMu0ewxjTDStz/clMWAIX2LM
	JfYpwWeiNeNw81FkuwXRiH5oUlq4ssU786aOsCJ78lwRSViXu2gcp3wkV1KqANvoer9JTA1G8jPLh
	jqi51kNnP4/m4TrX4YvZNBz6cN3sf/zQNkJVRmlmMtTmsGiEX/aqIL0ByWUhGiTAfbCymIyRqmDJT
	D+muR4PvhXpKs/dnxAC6fOjqCFIHyXzbGZ4R1B46xLIrG6b5cuKCOKF8JdFuJk6c/jKdEpw8lGlmb
	ktz4osuk5E1nk7pNYIJ99umaGCT2D0PhD03gl5kOnsQPwGXosS5cMT1CkFOmKTE/MlIr4JiE1HwFn
	1B66LkcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwDgu-0000000CDgL-3Zxl;
	Wed, 10 Sep 2025 05:48:24 +0000
Received: from smtpbgsg2.qq.com ([54.254.200.128])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwDgr-0000000CDc2-2WkJ;
	Wed, 10 Sep 2025 05:48:23 +0000
X-QQ-mid: zesmtpsz3t1757483248tf8f310e2
X-QQ-Originating-IP: KVh3ktC16c3+M4mK2vmK3P0xJ1csK5INbnJe0MsZUVk=
Received: from dkx-H410M-H-V2 ( [183.51.121.90])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 10 Sep 2025 13:47:26 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 671171605676410902
EX-QQ-RecipientCnt: 17
Message-ID: <55CC0521CC5B0671+91c4b933e5c5f604ade4f7e314be6fe49efc9e99.camel@t-chip.com.cn>
Subject: Re: [PATCH v2 1/2] dt-bindings: arm: rockchip: Add Firefly
 ROC-RK3588-RT
From: Kaison Deng <dkx@t-chip.com.cn>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Jimmy Hon <honyuenkwun@gmail.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, Wayne Chou
 <zxf@t-chip.com.cn>, Kaison Deng <dkx@t-chip.com.cn>,  Quentin Schulz
 <quentin.schulz@cherry.de>, Dragan Simic <dsimic@manjaro.org>, Jonas
 Karlman <jonas@kwiboo.se>,  FUKAUMI Naoki <naoki@radxa.com>, Peter Robinson
 <pbrobinson@gmail.com>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org
Date: Wed, 10 Sep 2025 13:47:26 +0800
In-Reply-To: <20250909-romantic-efficient-sambar-4fc38f@kuoka>
References: <cover.1757322046.git.dkx@t-chip.com.cn>
	 <27b2ce7950fdbf28c6c8404c3f8be3c1c35d6b3c.1757322046.git.dkx@t-chip.com.cn>
	 <20250909-romantic-efficient-sambar-4fc38f@kuoka>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.5-0ubuntu1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:t-chip.com.cn:qybglogicsvrsz:qybglogicsvrsz4a-0
X-QQ-XMAILINFO: MrfJYRspGRl/g0y08jEFrg1Gr7cmX5Hqt+guH/fdbK/ww4DzHDHa/Csf
	HUMY7QbRdHawoldBNhjz/03ovWttQZ/BNvGhsr5Axsa41deUPzfBqPhZVmWRXYJbC2aYZp/
	nm1b8lhdg4xKWB9ZvugxxZcPZCV3yGakoB0Gvss1pUxuyJ1B6GpXXuPaywXJqWL5PwgynBO
	Bwa/u6rUu4/8zOeGrLyEcBDrrVoeU/o8Kp6Y9UEdA/JhsBtY7fjtNdcIMg00Gh1GNQUd/LQ
	AsZOoLwek4yFry/W2FPLAELzviO+tGzB+miPOmul1A0d1TqImNXlMRgJR7Z13uFy/HSVTd6
	HWH0YD6anh3t7fKl1TcdMHXg9yK5mHXjKU4kMkTzw2yllyALon9nrbNvKm/QUNQFir7L+R9
	yIDLQtf2dMUXr9ZvCE5gyXEFD+0Qn6sUD5VdM5HXy1W+U9oRiLerNAY79G7l7/qR7QQPcd6
	6Gg+XD+KUQiDVDRpkQS3OMswELU1vtoxKpi4ixL3FshDZz053lu7VJ3LTgvooW5am7lTULP
	giAUAKzR8Bbh6jvPviQZazoRb6v8ucnxX9o/RK+4fHx9HMxlcXEzjg1R6DXOulZoCz0jJFC
	fOLME+VVj+uGSODB6ebMb3cO8tD41UjjVdh4zMtqduSS07rmzxsGbH2bSN/I3q8hKNW+G64
	VnhwLcVsQWcD49/lGsK4u4JX1B4zDr9BHF5jI0ss7s85B51sPIJohv1NpIvyuRQ8lPxvvBq
	F0NKajMS7T+cYYzWspOwRBMSAH3UkSkVxA5zNkYyaPXdMiw7Mz7HQKTFOF8po6jP1Cw9Zw0
	4z9ZYCcjCP/9CXLrDHT21zBZhYsusjEhm9Vouc59z3B279yfIzHCS6DpPAWyISsCqf7qh5e
	vlEXnMRX6yteAqOoIJjVZb3dfVvebe5PHETlqHwVXEOJpQmMrs1c3zdXeyNcIWSIAFCjrsw
	MTFmDpQKI4MNFE2ctTqvtXvKPtgta3UspV39c0SCfMcNH/1f6unW4NUwaZ5K1DQHak1tB7S
	P9O8l++fS8CBWFChHx9Cs1gmaN45zLoygTL37xXGXLLBvLKCfF
X-QQ-XMRINFO: M/715EihBoGSf6IYSX1iLFg=
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250909_224822_037522_31E11352 
X-CRM114-Status: GOOD (  18.68  )
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

On Tue, 2025-09-09 at 09:22 +0200, Krzysztof Kozlowski wrote:
> On Tue, Sep 09, 2025 at 09:31:47AM +0800, Kaison Deng wrote:
> > This documents Firefly ROC-RK3588-RT which is a SBC based on RK3588
> > SoC.
> > 
> > Link: https://en.t-firefly.com/product/industry/rocrk3588rt
> > 
> > Signed-off-by: Kaison Deng <dkx@t-chip.com.cn>
> > ---
> >  Documentation/devicetree/bindings/arm/rockchip.yaml | 5 +++++
> >  1 file changed, 5 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/arm/rockchip.yaml
> > b/Documentation/devicetree/bindings/arm/rockchip.yaml
> > index f9ee77f17ad7..6aceaa8acbb2 100644
> > --- a/Documentation/devicetree/bindings/arm/rockchip.yaml
> > +++ b/Documentation/devicetree/bindings/arm/rockchip.yaml
> > @@ -258,6 +258,11 @@ properties:
> >            - const: firefly,roc-rk3576-pc
> >            - const: rockchip,rk3576
> >  
> > +      - description: Firefly ROC-RK3588-RT
> > +        items:
> > +          - const: firefly,roc-rk3588-rt
> 
> That's just enum with ROC-RK3576-PC. BTW, all these descriptionis are
> completely redundant. Actually getting harmful, because copy+paste of
> the same is only obfuscating code.
> 
> Best regards,
> Krzysztof
> 
> 

The ROC-RK3576-PC is based on the RK3576 SoC (4*Cortex-A72 + 4*Cortex-
A53). The ROC-RK3588-RT is based on the RK3588 SoC (4*Cortex-A76 +
4*Cortex-A55). They are two different miniature single-board computers.
So it does not apply to the enum with RK3576.

Link: https://en.t-firefly.com/product/industry/rocrk3576pc

Best regards,
Kaison



