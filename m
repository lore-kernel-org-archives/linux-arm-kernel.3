Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BC10CCFA13
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  8 Nov 2025 11:44:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dwBo8FRQlkZa7YdcVTQlB14Z0N5afMKJRbUn9RoyeU4=; b=TKxx9pc24GjxIAtVwJLHnvWrI9
	Hh0FMsz1ZFyJ7Y2Y53N6T1jnTdGuRxiUeVXa5NvT+cpyDCkVUSEbVfLoda2YvPxk9LFizA9PwilG0
	OlCcoCn61B5arFJwJqBbRCof+GbzLvqVkmOknQ0p6d/D9j/7D4yMGWY7DTr7s/0StzHHJBPwYDX5L
	77wQypv9SgnmhtWKiX6HvS2Jjw6D2//WTJaYN7klFaSQhp9T8GXOoyUB78iO3YUHaFeQW/WTy57uN
	nr0ZXStxNr5zdYeBDXXwGBACgtco/o5vPxuDdxFC8GzyAldubHcKdsyozSKuMvr1E0DrGy7FZf3+d
	JPNP2j2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHhMR-000000035Lr-40nU;
	Sat, 08 Nov 2025 11:44:03 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHhMP-000000035LX-03zA
	for linux-arm-kernel@lists.infradead.org;
	Sat, 08 Nov 2025 11:44:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 5439C40BF9;
	Sat,  8 Nov 2025 11:43:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A18E0C19422;
	Sat,  8 Nov 2025 11:43:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762602238;
	bh=E39zBR+/q8Bg8pTqde3U5WC0/GsvxvWX3vKNLyHS27U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pEdxv21qocJeC0qMkvDuMhfJwTqyYCCHbgEJd2v2eFxjz7zoOrw91Nm0SmX9c41SG
	 bSEKsZS7n7wUK2zBQUQbzNFjPsB0pHOxPzjcx9TgIv2tMSheVD0IDDfIxunixiTSnf
	 7tUTJJD/mSD54PK+C2S7POiZ6YmlfskIWxL8PcY9m8/bOGHJ6zs5vDrriwTKYqkist
	 e1Vc72tkibEThvA1oG6+GVp1aAJsIHr9mDQoGrpmssVqO9fGZR25Um54J+FdBkZMJl
	 f4qT5bd7IRb8phRSsmhks47gcAuE4TeyPGIc49o/wATCcbSSFlZy/ZPlItyv1tx1UZ
	 S6NQcVhnYumqg==
Date: Sat, 8 Nov 2025 12:43:55 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Vikram Sharma <quic_vikramsa@quicinc.com>
Cc: bryan.odonoghue@linaro.org, mchehab@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, andersson@kernel.org, 
	konradybcio@kernel.org, hverkuil-cisco@xs4all.nl, cros-qcom-dts-watchers@chromium.org, 
	catalin.marinas@arm.com, will@kernel.org, linux-arm-kernel@lists.infradead.org, 
	quic_svankada@quicinc.com, linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, quic_nihalkum@quicinc.com, 
	stable@vger.kernel.org
Subject: Re: [PATCH v6 1/2] dt-bindings: media: qcom,qcs8300-camss: Add
 missing power supplies
Message-ID: <20251108-khaki-shark-of-devotion-cf4bce@kuoka>
References: <20251107162521.511536-1-quic_vikramsa@quicinc.com>
 <20251107162521.511536-2-quic_vikramsa@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251107162521.511536-2-quic_vikramsa@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251108_034401_147656_E8FF03F7 
X-CRM114-Status: UNSURE (   9.16  )
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

On Fri, Nov 07, 2025 at 09:55:20PM +0530, Vikram Sharma wrote:
> Add missing vdda-phy-supply and vdda-pll-supply in the (monaco)qcs8300
> camss binding. While enabling imx412 sensor for qcs8300 we see a need
> to add these supplies which were missing in initial submission.
> 
> Fixes: 634a2958fae30 ("media: dt-bindings: Add qcom,qcs8300-camss compatible")
> Cc: <stable@vger.kernel.org>
> Co-developed-by: Nihal Kumar Gupta <quic_nihalkum@quicinc.com>
> Signed-off-by: Nihal Kumar Gupta <quic_nihalkum@quicinc.com>
> Signed-off-by: Vikram Sharma <quic_vikramsa@quicinc.com>
> ---
>  .../bindings/media/qcom,qcs8300-camss.yaml          | 13 +++++++++++++
>  1 file changed, 13 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


