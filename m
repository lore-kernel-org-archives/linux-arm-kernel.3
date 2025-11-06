Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CDA0CCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Nov 2025 09:01:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=07XeBrj8Ig4iz1iB3KfWU6PAQroQpuT6GPmMNUfM3NQ=; b=kqszsSi3r8tvDBWz9adpe2zUT3
	flNG8WRo4NbtJPsGC0T2D0QxaME8C1C3kE1cmBbSmbbhxCmTivWMudx2gR5JoOwVtltm1cGiH+FJ/
	BJx8tHZ4HqM5fKk19fZmiIIzCU4kJ7cErLpU0nvdlB1ahtOKm/AbhCgyqtclYF6pkwk9VRPnmqZeE
	+q0ylDomhb/2zR3rVVkehwFPquL0XyAtfd6EJyuIf4SXqQVivdVkqL7KKTHg+QVoGzzrImZ5sM9tm
	YpgrCg/AutJqPzoRLgNXP6oFBMPpQ6vtm9znwd+8xDWQSaRnTjtj95t6yduR4CmVQAgV8lSPRIR9T
	TOJf1pJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGvre-0000000F7ES-0ABY;
	Thu, 06 Nov 2025 09:01:06 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGvrV-0000000F7D6-0OW6;
	Thu, 06 Nov 2025 09:01:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 4346944AD1;
	Thu,  6 Nov 2025 09:00:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E4CEC4CEFB;
	Thu,  6 Nov 2025 09:00:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762419656;
	bh=KVHSoYJz2fwVZGAv/nzMWmyyfkWgXd7S9jVEFUkbYwo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qlw5w1+NizkOPD/dk3OD9kbZdpOFMgUPNCC9J8kf1XlJfrHK+jjwQPQubxx374/hk
	 Npm22YxBUAG7CSrWPQJdC33yE8EVP1RCv0deqhKAeK4wvcecOWjzBFUWt9E2QyTxWN
	 JczIRfA8P5JE3x8Awuz+FPRVcx49/iuURwOsFlcQYK09lr7QV0NDfLzlr0lSEVM36Y
	 qbn9dhWm1jufOB0WSUkqYS8cEqCQK7rop/LXPPVexsZ4ud4OZsFbxL8xwO47wBlY1S
	 6lp+YoSJMO0XCC4e+xYTI+xA/PQiTVdR+7EX/Aof6IqvFvocnqCk8dhjKj7hYkN98h
	 tX0n8fFBMV6BQ==
Date: Thu, 6 Nov 2025 10:00:53 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Xianwei Zhao <xianwei.zhao@amlogic.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	Heiner Kallweit <hkallweit1@gmail.com>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org
Subject: Re: [PATCH 1/5] dt-bindings: interrupt-controller: Add support for
 Amlogic S6 S7 and S7D SoCs
Message-ID: <20251106-gleaming-taipan-of-penetration-147b8a@kuoka>
References: <20251105-irqchip-gpio-s6-s7-s7d-v1-0-b4d1fe4781c1@amlogic.com>
 <20251105-irqchip-gpio-s6-s7-s7d-v1-1-b4d1fe4781c1@amlogic.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251105-irqchip-gpio-s6-s7-s7d-v1-1-b4d1fe4781c1@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251106_010100_792286_DEEE7BAA 
X-CRM114-Status: UNSURE (   9.90  )
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

On Wed, Nov 05, 2025 at 05:45:32PM +0800, Xianwei Zhao wrote:
> Update dt-binding document for GPIO interrupt controller
> of Amlogic S6 S7 and S7D SoCs.
> 
> Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
> ---
>  .../bindings/interrupt-controller/amlogic,meson-gpio-intc.yaml         | 3 +++
>  1 file changed, 3 insertions(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


