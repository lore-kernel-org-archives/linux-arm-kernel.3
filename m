Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8BE9CD5BD0
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 May 2026 09:37:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7Ans3+/oH/5Uv0sR0ES4/flI6mRgdotxu4+DiwqvkfE=; b=p6U5AicYLYe81uGaGcO2GDNmkN
	HApCEpkV0nZe/OcrksEmJpiTtZzsP7TxAfmfnlM7Iu4+ogxS8VHmkzmXRxWTMjgH8jjlrVheiysMD
	lalPXJGCI8RF4Irr+1FLmQfmMJzuN4MuE2uDjbEOQ/dJs+Ac3dvHrxiKVA4StDK0h7btSmpuAZvrR
	sK/R/SQXgqt1Cg9jX28CvTHUShryyhykWjujRaHCQhTWSeslPHz2fyqCcKDd+4+gkgIsYNdKZRlBy
	J/8S6x7lPZ67yQufj8Q21Cu2mCfFRvdUMy6n02isVF8toxaH/fCUn4CyL9xZacqNULnWX/YMrrnlL
	CTowIzAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRoDu-00000001XbT-2O0x;
	Tue, 26 May 2026 09:37:18 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRoDr-00000001Xaf-2PGa
	for linux-arm-kernel@lists.infradead.org;
	Tue, 26 May 2026 09:37:16 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 3BA3541977;
	Tue, 26 May 2026 09:37:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1BDD61F000E9;
	Tue, 26 May 2026 09:37:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779788235;
	bh=7Ans3+/oH/5Uv0sR0ES4/flI6mRgdotxu4+DiwqvkfE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=fvjKR2GD+GDLQNoQvPmVwUD055Y5IIZpu392iLUTQPdiOYcDSjG7OUF0CIQFYWBy4
	 28KGZ+S/IFdZ5nkE3GvJvo4A6+IgF13FuNlo6KRVj9SEQ1pZFbusbkwWR+O6SPfZGo
	 gMIH9wL8v4y+35O2UeV3BGagRm5H7hLTbLo7mk7aXZ+JAscy0QeE+LtIJUbSBDmXVI
	 9hCzEXi+RdMPRmdIbl3rOq+FlSzP2F/Wp3zjLyQFqTZIES6HCITEhQyPZepUEYJioT
	 iWbY6BYQyPgmpr1lpBrRWkueJILJaqOJQiudiNIALUrg1g71ztNiHeaTLmYhH0RqWY
	 HTGcNrzmeObdQ==
Date: Tue, 26 May 2026 11:37:12 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Luca Weiss <luca.weiss@fairphone.com>, 
	Ajit Pandey <ajit.pandey@oss.qualcomm.com>, Imran Shaik <imran.shaik@oss.qualcomm.com>, 
	Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v5 1/7] dt-bindings: clock: qcom: Add video clock
 controller on Qualcomm Eliza SoC
Message-ID: <20260526-muscular-skylark-of-wholeness-6ef2a8@quoll>
References: <20260525-eliza_mm_cc_v2-v5-0-a1d125619a5a@oss.qualcomm.com>
 <20260525-eliza_mm_cc_v2-v5-1-a1d125619a5a@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260525-eliza_mm_cc_v2-v5-1-a1d125619a5a@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260526_023715_633887_2FC07F4F 
X-CRM114-Status: UNSURE (   9.68  )
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

On Mon, May 25, 2026 at 04:16:03PM +0530, Taniya Das wrote:
> Eliza Video clock controller is on CX and MX rails similar to Milos.
> Add compatible string for Eliza video clock controller to the existing
> Milos videocc binding and add the dt-bindings header for Eliza.
> 
> The video clock controller exposes power domains, so '#power-domain-cells'
> must be present in the device node. Add it to the required properties list
> to enforce this in binding validation.

That's ABI change, so you need to explain impact on existing devices -
Milos.

Best regards,
Krzysztof


