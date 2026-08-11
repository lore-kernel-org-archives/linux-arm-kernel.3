Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADCFBC5B569
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Aug 2026 07:03:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wx53Ap3mrvChep95/lU+75w+ogUAiLoztEeouw6F2LQ=; b=JQq0XrlW1+8kbbohqYU/v4+oI1
	Tk9jcBeIcjjbzP4oeUsRUl8QVLLMwpIah21IkFaYgumJa3HkAuBs8aMvW3j78DTNsaWg3fN7TOYf+
	5LrRmp9wldUuCTrrKp7abSqWckdxdufNgI5GFyFNusVwKk3/v4cAmY/VjjdXcnqupwzSkDCD1+oLW
	/oa2kkT3iVTV9U9/mEKdf9BRClPlhK8w89JSv7f1JJBO+XIU67A/8Dm5oH0Kj2FW33EeyByHHPPc3
	6NCzXtXr2ZTUjsCqte0TAhEQz/V0HIfy++I1rV+SYSqvlFpEdd26cqrsCB2CvK5V43zTBnR2D/MNl
	uKD8Mclg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtgWF-0000000DTkl-2hcv;
	Tue, 11 Aug 2026 07:03:27 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtgWF-0000000DTkf-0EUb
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Aug 2026 07:03:27 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id A656641775;
	Tue, 11 Aug 2026 07:03:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C93ED1F00A3A;
	Tue, 11 Aug 2026 07:03:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786431806;
	bh=wx53Ap3mrvChep95/lU+75w+ogUAiLoztEeouw6F2LQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=QXj7YKtJ1ISP/nOGFp1MkHFIYyMUMD8gVgJnzdfT6sRYsTZ+MrwZun590xJA/je/W
	 oV9DukkOEYE+l8++aPoZ0pdZxVSYX+RdU+JxTOjUtEND7bfsMqTGLSLaNaoRwmL2HI
	 WobQNpyywlXbsGTUFAjVbUzTyRsJ4WSWbySu7ds6XHEp+oxNaZtTvNSJrKtHeVYIYF
	 ZkTbfbrefFzn/45riO0XmmXTow4+HYV9jbaEraODjtVgc8Ep711eE6M33d5ydoqHBA
	 vLlyepjS7FRbAddd7UKWQKOvpUo9H/w9gq9AuNbxlVrMnaBx7FwPFbUn4ex8sIkss4
	 +f/nTygUtAkpA==
Date: Tue, 11 Aug 2026 09:03:23 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: David Heidelberg <david@ixit.cz>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Henrik Rydberg <rydberg@bitmath.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Petr Hodina <petr.hodina@protonmail.com>, linux-input@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	phone-devel@vger.kernel.org
Subject: Re: [PATCH v5 1/3] dt-bindings: input: touchscreen: st,stmfts:
 Introduce STM FTS5
Message-ID: <20260811-inescapable-indigo-pig-0a5c3f@quoll>
References: <20260810-stmfts5-v5-0-0c737d929976@ixit.cz>
 <20260810-stmfts5-v5-1-0c737d929976@ixit.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260810-stmfts5-v5-1-0c737d929976@ixit.cz>
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

On Mon, Aug 10, 2026 at 05:21:40PM +0200, David Heidelberg wrote:
>          touchscreen@49 {
>              compatible = "st,stmfts";
>              reg = <0x49>;
> -            interrupt-parent = <&gpa1>;
> -            interrupts = <1 IRQ_TYPE_LEVEL_LOW>;
> -            touchscreen-size-x = <1599>;
> -            touchscreen-size-y = <2559>;
> +            interrupts-extended = <&gpa1 1 IRQ_TYPE_LEVEL_LOW>;
> +            touchscreen-size-x = <1600>;
> +            touchscreen-size-y = <2560>;

This is not explained in the commit msg.

>              touch-key-connected;
>              avdd-supply = <&ldo30_reg>;
>              vdd-supply = <&ldo31_reg>;
>              ledvdd-supply = <&ldo33_reg>;
>          };
>      };
> 
> -- 
> 2.55.0
> 

