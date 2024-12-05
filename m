Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40C3EE7716C
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Dec 2024 08:27:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oIMXz/uFCYpLKGOX9in0cB4oBD4wKDeExNYjvajsK3U=; b=Gbe6OBk40Kcm46irUwCGzliX8i
	RbEZeBQLXX0WnkOquEAsCuzFqP8mEKhXLjiV4CjprSaxOs3C8rd7SCGqVu7vAcxV/yeE2VUE6CrV4
	Gdf/ZJW0lE4ZXRH9hwhEXrGmli0fWK1JAylAsRJUS7spiqIOC+tCIvDUIHHlPXPWqg3gsot51BwlS
	GwwZOQ/6LPq1MkuCwLyh+72fnYPa7U6zBPn6foNzPk7f+NYFozc0DuO8YO2JjdxZQQmNcztLJHSXh
	3cw8PxLeTaOPRhIfzn0AQ7AXmnsq2+W8n3Qko27Ni6dzhA2ibtiPzjSfrE+z/mxInuwfnKa/08Z32
	iimU/1Jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJ7Cn-0000000FAwB-0yRQ;
	Thu, 05 Dec 2024 08:27:25 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJ7Bk-0000000FAcg-44rP
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Dec 2024 08:26:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 269AAA420B4;
	Thu,  5 Dec 2024 08:24:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17B2EC4CED1;
	Thu,  5 Dec 2024 08:26:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733387179;
	bh=XH+cYuaDd34JH2epRrx9wpA8eMHcKpnONy1B2w+jaEU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=vRATLDEv/hnSkrUE9lFzL/yFaC9dR/siOLEUPTebWojXWZOQtrRdCbG00ZFHyVn1c
	 q2CKYpqYEPeNwuLRBF7sd/PNLYuWso+oC4LbWgax/48J9ffWm0zNEquQWIge8v1kxC
	 AJB1KZhVNh2KdhFtPYCy8cKcX7gVswK2aCQ70v3ky9g0ySS09i4S0vtXjye+EzDlde
	 lPgPFDrmO75hxfgPh/kK9HyQOxRdPPY3gLwUv4e5+mLIooN/Wv7F0ia8y/3Mc9U+oL
	 IWZ5Xc3x5UTMtfNVJy1r3nrcM/jLs43yQwGb+mRaNTbwjaBbGFcGUdRG/N89gcRQKV
	 5BYQRZ9mMYIYw==
Date: Thu, 5 Dec 2024 09:26:16 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Vikram Sharma <quic_vikramsa@quicinc.com>
Cc: rfoss@kernel.org, todor.too@gmail.com, bryan.odonoghue@linaro.org, 
	mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	akapatra@quicinc.com, hariramp@quicinc.com, andersson@kernel.org, 
	konradybcio@kernel.org, hverkuil-cisco@xs4all.nl, cros-qcom-dts-watchers@chromium.org, 
	catalin.marinas@arm.com, will@kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, kernel@quicinc.com
Subject: Re: [PATCH v7 1/5] media: dt-bindings: Add qcom,sc7280-camss
Message-ID: <oko5qqysmxhicqzkwhkz54wvsmt64ba3cd37zkcy55ee77owbk@5z3zetfr2ejx>
References: <20241204100003.300123-1-quic_vikramsa@quicinc.com>
 <20241204100003.300123-2-quic_vikramsa@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241204100003.300123-2-quic_vikramsa@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241205_002621_080721_C09EAAF3 
X-CRM114-Status: GOOD (  11.54  )
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

On Wed, Dec 04, 2024 at 03:29:59PM +0530, Vikram Sharma wrote:
> Add bindings for qcom,sc7280-camss to support the camera subsystem
> on the SC7280 platform.
> 
> Signed-off-by: Suresh Vankadara <quic_svankada@quicinc.com>
> Signed-off-by: Trishansh Bhardwaj <quic_tbhardwa@quicinc.com>
> Signed-off-by: Vikram Sharma <quic_vikramsa@quicinc.com>
> ---
>  .../bindings/media/qcom,sc7280-camss.yaml     | 418 ++++++++++++++++++
>  1 file changed, 418 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/qcom,sc7280-camss.yaml
> 

...

> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/qcom,camcc-sc7280.h>
> +    #include <dt-bindings/clock/qcom,gcc-sc7280.h>
> +    #include <dt-bindings/interconnect/qcom,sc7280.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/power/qcom-rpmpd.h>
> +
> +    soc {
> +        #address-cells = <2>;
> +        #size-cells = <2>;
> +
> +        camss@acb3000 {

If there is going to be resend, then node name: isp

Node names should be generic. See also an explanation and list of
examples (not exhaustive) in DT specification:
https://devicetree-specification.readthedocs.io/en/latest/chapter2-devicetree-basics.html#generic-names-recommendation


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


