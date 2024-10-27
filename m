Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D007CD13587
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 27 Oct 2024 21:08:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qdPF6NOKLB3j4XA6P6zhFX0eegfYJY+iTcyB4ekzs70=; b=K+/6/G5nkWo8bRyh0IGBUI6fJu
	khC36YlhrQ4qJGiahGnqxGUTrvqYKSfI8zEaI2v6hm1kzCWgDMkWLVBZIQkY68ype6IdZy55RFQEM
	9i6yrudj7iGjPQTC+HHeAFq31Mkh7WrsIjzoKRt2hkPRoJfzPTKoh/asYBJ/flFIQhkJoih8O7L+L
	UKIMeN8CY3hE4+9LtObyk39kePFInSht2vtdf6ULKyDS5gTyud9pPaKuTJFe5CO6tBLMQ8poJp4DQ
	nf4KZZtcbUkfyifIq6RSBQAo3/6gwBN3Yqfk+/5AcVEiXGNsNAcQVzzcMxEZK+OVFCFApLku+2/1Y
	eU3ReoAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5AUr-00000008uRj-35Qm;
	Sun, 27 Oct 2024 21:08:25 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5ATG-00000008uHs-2o7j
	for linux-arm-kernel@lists.infradead.org;
	Sun, 27 Oct 2024 21:06:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id C13205C58B3;
	Sun, 27 Oct 2024 21:06:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E333C4CEC3;
	Sun, 27 Oct 2024 21:06:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730063205;
	bh=CO7k2Dg/RtRuxPaLMt+WxKeEr7MfB16b+EAkMICuDQY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pIIcuwp4gdtTDh6Clgp23Kw9gsZ0nOzwkhUKsgMa2vpwg3C9L91p4Fy3gnTZjk6po
	 r3lhEHhgiMCAQYilsGrxu7mOghlEBJuMKhG/xrZ0iWsEGBbqEHlq3K60fcx910Nrh3
	 EsrJWjlmiKyCCifgbgeLoYpS0TA37cXTgXO/2MqyZP7srQ9xsx3D0S4XfP+0F92gYJ
	 MkamC0N2UAGHHFUJoK3YrNWH2XOe27G8eADqIvi+KwXk0EYJ0dpHW7LnIqlzbXIrAn
	 NQbmNOyqYHJRnYlIEwsvScQ0Kvt+xdm/xbhaOPUAdT5M/rCyUxBOsFZwHtDTbSL6c2
	 mycV4qiZ7HAMw==
Date: Sun, 27 Oct 2024 22:06:41 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Markuss Broks <markuss.broks@gmail.com>
Cc: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>, 
	Maksym Holovach <nergzd@nergzd723.xyz>
Subject: Re: [PATCH 1/2] dt-bindings: arm: pmu: Add Samsung Mongoose core
 compatible
Message-ID: <zcxzmsc642ggozzpj73skzxfce7jnoj7fmdg57edbin2rfh7mn@6acurllfar73>
References: <20241026-mongoose-pmu-v1-0-f1a7448054be@gmail.com>
 <20241026-mongoose-pmu-v1-1-f1a7448054be@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241026-mongoose-pmu-v1-1-f1a7448054be@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241027_140646_780286_38245B72 
X-CRM114-Status: UNSURE (   9.97  )
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

On Sat, Oct 26, 2024 at 11:28:08PM +0300, Markuss Broks wrote:
> Add the compatible for the Samsung Mongoose CPU PMU to the schema.
> 
> Co-developed-by: Maksym Holovach <nergzd@nergzd723.xyz>
> Signed-off-by: Maksym Holovach <nergzd@nergzd723.xyz>
> Signed-off-by: Markuss Broks <markuss.broks@gmail.com>
> ---
>  Documentation/devicetree/bindings/arm/pmu.yaml | 1 +
>  1 file changed, 1 insertion(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


