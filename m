Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27DD4D2D0EB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Jan 2026 13:04:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7DPc02BPDXRCPlk55tE1zQ0yL7hZ4M+jB2XH8eiaI/I=; b=tRWnLf7LS10hXaktcT5gWZ94qO
	pZ707fyG8VU8PcAKlzV7pK4P7u3y6rgRJADvdlRWKnBM3R8cElIkFQyoRU00+SPXwqppiXgHuO4Uh
	CarlZXvnxud6OeT48FvIRoJuVbmS7k0p7InlVq/rvBgOa51BDnUPURfHd+rHEXM/5TDkYYUdsTzJz
	7tMIx/mZ81Zha7QlFVWIJoBt6mRLL7be7H2DlEcg5n+8p7GmuZ1Hjne5SeMSRmdBFAa7c4WlBX/dk
	8mFCZIqLqMssbXaOuoMahz6dOF+63IQieVL4FGfDiAplUMNm4B+04iooLhXOzQ3Es/NmmywPHqx/M
	Ru3C2uWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfe4H-000000077tX-153F;
	Tue, 13 Jan 2026 13:04:17 +0000
Received: from zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfe4E-000000077tA-0Kp6
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Jan 2026 13:04:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=7DPc
	02BPDXRCPlk55tE1zQ0yL7hZ4M+jB2XH8eiaI/I=; b=V+1h2I/iWdDQ7lWhEi2l
	9pJAtKZx+A6z/JC/8qe1ZTjaH2STVl1tsXNQ1KIX2ObdGT9BSYi4MCDq78mpqmPx
	5SQtOie9cfkkiG9X8CBwC+lCS/Gf2q1FyXTbSYE+4TcaDFbDe32ocmZZXjefETjF
	ahT8VBejvt3D6z050ICyY93HKlWeBwyhN0hZKQIwdh88FqKd4EI7gvt1sviqw2h2
	OejEjQS8cjiHsCd45kYAY+lTCAwhLqu8/HPAFZvzaNEKS2Y2H4pfx3wAcsVYVk9+
	qVsC6/DIoT3AD//boMi4BQobmP2E8+7hxyUKGtASFmqcsdWcBUP5Dvezz1/rYuJ2
	dA==
Received: (qmail 1687664 invoked from network); 13 Jan 2026 14:04:10 +0100
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 13 Jan 2026 14:04:10 +0100
X-UD-Smtp-Session: l3s3148p1@QnyfoERI7q0ujnvx
Date: Tue, 13 Jan 2026 14:04:09 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Alain Volmat <alain.volmat@foss.st.com>
Cc: Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Pierre-Yves MORDRET <pierre-yves.mordret@foss.st.com>,
	linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/5] dt-bindings: i2c: st,stm32-i2c: add 'power-domains'
 property
Message-ID: <aWZCyYc8QAY1LOtF@ninjato>
References: <20251215-stm32-i2c-mp2x-dt-updates-v1-0-2738a05a7af8@foss.st.com>
 <20251215-stm32-i2c-mp2x-dt-updates-v1-1-2738a05a7af8@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251215-stm32-i2c-mp2x-dt-updates-v1-1-2738a05a7af8@foss.st.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260113_050414_415395_CB403045 
X-CRM114-Status: UNSURE (   8.58  )
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

On Mon, Dec 15, 2025 at 01:19:40PM +0100, Alain Volmat wrote:
> STM32 I2C may be in a power domain which is the case for the STM32MP2x
> based boards. Allow a single 'power-domains' entry for STM32 I2C.
> 
> Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>

Applied to for-next, thanks!


