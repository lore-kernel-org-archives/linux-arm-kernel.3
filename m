Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6367CA5FA1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Sep 2026 08:40:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j/CLrtLe3fBJ5VYGQS5tjlTm/0gBXqbRsnQnrAUdh0U=; b=RXjhXNjyMnM3/84cuTF/ZPOL+A
	zIeAtwBcEht/2bRk1H181m82xNBchyX1lOprkOBCthSf9J80TrJIzXM4GpSPmZoJGF+7BuRCzAaRh
	wO/lg0b72I9wQX29DV0SoaTtoD5mBX4IdonZuxnWDqsYxZ0BDb3N1Wa0cZhnSykUvJMaeAGDG8jMg
	Wmhm9cfKQ0XAq5yar4CZv8L5x8T/kAUCgcuFnz5dMrNV/6GusODC31VBPjAWpS3TYuWGaUS2C6ZvO
	x+iNQuzFmMhTCNN8XiSu5yJ4jihZ6RCCfWVlWJUbkI7dD00XXm3YqarYuBZIx2F1JeTHUVWdJTZmf
	RAkJYpLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBTO6-00000002p6G-0FjP;
	Tue, 29 Sep 2026 08:40:34 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBTO4-00000002p5s-19Np
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Sep 2026 08:40:32 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 0E42642AA5;
	Tue, 29 Sep 2026 08:40:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E54851F000FF;
	Tue, 29 Sep 2026 08:40:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790671231;
	bh=j/CLrtLe3fBJ5VYGQS5tjlTm/0gBXqbRsnQnrAUdh0U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=b7UXzj5G5hYhlifBWvT6qdrIYlAI4T3HRclnX9E1LyQnzSqpZ+B7e542BqZN6j5Qm
	 n+T4qs2S5MLg542Uwg1EbLTSeHsN5KAyhtggdlfyRBN+rLGb7JTsb4gRBNVIY48yA0
	 GagFw6DwbzwFbtRFNsDNCRZcQBMedT5rzWTFGOYqDbFfZBc9YZ5QtYqHqO4NFiZJ4u
	 hIzg3RTWna54IhStecRwt6JqYkki+HjnzDx9nUPX1j4gYJ4xSSfHJ93ymg9BmlKqH2
	 EQbhwsxBGtta+nF4DSWAn0e0MOJeYNAgCjPEdZKVCpCuS29xUDlXwhh5EFe20ToGlA
	 cnUbf4aGTmXIg==
Date: Tue, 29 Sep 2026 10:40:27 +0200
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
Subject: Re: [PATCH v8 3/5] dt-bindings: input: touchscreen: st,stmfts:
 Introduce STM FTS5
Message-ID: <20260929-vigorous-cyan-chihuahua-b0e4a2@quoll>
References: <20260925-stmfts5-v8-0-0fcf49e2c85f@ixit.cz>
 <20260925-stmfts5-v8-3-0fcf49e2c85f@ixit.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260925-stmfts5-v8-3-0fcf49e2c85f@ixit.cz>
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

On Fri, Sep 25, 2026 at 11:22:21PM +0200, David Heidelberg wrote:
> Introduce more recent STM FTS5 touchscreen support.
> 
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>  .../bindings/input/touchscreen/st,stmfts.yaml      | 22 ++++++++++++++++++----
>  1 file changed, 18 insertions(+), 4 deletions(-)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


