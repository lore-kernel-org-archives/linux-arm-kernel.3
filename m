Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97862F3ED51
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 11 Apr 2026 14:01:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DNoLxncQwYLUUPPHKcwH4YtOHqXzOTHuVzColr2iBIY=; b=B8JqpWjmky1NYGMWxjSy/b0QUc
	9oJkYmXDki+qDbi8F8z8dYRhdLYed9KlEmBdbK7Ym/WNaGddbyd2cPv/2NNwOiW1CYDsXq7iEkVBp
	PCt/ATw+mQ5S5y1BwLbfS8qnO58EX3UDY7Uu4/ajs3fGDHJKmUaT/G95PVbyIJFe3sMalQZBJqM3l
	jhpgDli+Ob/UZN7b7360SVGQrkUv0ZGLv4b2B/rn6iSKbYH8d+sGGD01lUcZNEUkT8qNxpXht4G5o
	YXdIOTRwrDbZDvsF38jfl2Wq1/yWkCA113UdpTfzIFdgZkfD9itbVvR3f4JvuuXz1SPlj/ysWL5eO
	poZdu7aQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBYtj-0000000DUfG-1FRg;
	Sat, 11 Apr 2026 14:01:19 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBYtg-0000000DUd3-2VyY
	for linux-arm-kernel@lists.infradead.org;
	Sat, 11 Apr 2026 14:01:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 720DC41728;
	Sat, 11 Apr 2026 14:01:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EAD43C4CEF7;
	Sat, 11 Apr 2026 14:01:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775916074;
	bh=zMQAjZnqu7cingfSFT93HgX3xVl7kJGu55bIC2BPZC0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fibVdRXpFVBtMh8is7+fWFJ/FwQnltlwXPrjcVyD1/DX/+whtdITt+HgUl+9DBi48
	 fne8Q+juqdi6mzg5B/DqvMzaWAcYfXhxOtBZqqn+tZPep9kSM64s2AyZ6yibdHdq1Y
	 MzgRnlKpVIPWWm1fGjdUmyNn9Ej94ZapvduXyuElPrqIkN8I3CZ3nO8mWhHGiURbMQ
	 bn0O9l6gf4xOF4wNajddiyQ4Er1Pz2STKoSctR44WVGrPIszV+QAT46ix2EpRlvkA3
	 rw2EUaYEkjSdpmZTKNNClNBqPAQV6z25v+1HTW/8VTZ2scBFENkhPa81L23swDe71w
	 OKGzWb9Z1upoA==
Date: Sat, 11 Apr 2026 16:01:12 +0200
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
Subject: Re: [PATCH v4 07/11] dt-bindings: input: touchscreen: st,stmfts:
 Introduce reset GPIO
Message-ID: <20260411-proficient-observant-bonobo-fc98b8@quoll>
References: <20260409-stmfts5-v4-0-64fe62027db5@ixit.cz>
 <20260409-stmfts5-v4-7-64fe62027db5@ixit.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260409-stmfts5-v4-7-64fe62027db5@ixit.cz>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260411_070116_665987_6EE82CB9 
X-CRM114-Status: UNSURE (   9.33  )
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

On Thu, Apr 09, 2026 at 12:15:50AM +0200, David Heidelberg wrote:
> FTS has associated reset GPIO, document it.
> 
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>  Documentation/devicetree/bindings/input/touchscreen/st,stmfts.yaml | 4 ++++
>  1 file changed, 4 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


