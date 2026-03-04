Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96161EDEC1E
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Mar 2026 07:50:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PcaE9WiFXjWWBlMEYPnQXSRhLPDvWeoE1f6fxXEnjvs=; b=ElncCOrccxcHFq+px2Br+/CLrk
	vbRmaxQ1U+DjcbhghwV9YwO5XfcNOs35x5vyJSLuc82jvKdqxsVNKbOo9KBXFL/l9niHkpyH7OYQP
	BML7rij1gv9RSHzsAjBLYE9gId4gpENikzrrhQDH15uWAe/iZSUKwicgA6Q0LiH1X8efoRauUe38b
	TEu+/UKqb2wexeFLCFbo+AzG9piIFVKnXECPHuwiVYEP2qfn2au+FjBPtn+atN+FK30q3KyOrLZF+
	C4ExzGk3bX6juZNpCZX7dP10mZx5IKLqYdFsCePBT2GjHqt+tI1kBDz7goGisvZplQqmRBz9dYqrU
	9mXCrILw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxgzv-0000000GfLl-3kKu;
	Wed, 04 Mar 2026 07:50:23 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxgzt-0000000GfJK-0jiB
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Mar 2026 07:50:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 69C2040415;
	Wed,  4 Mar 2026 07:50:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C08FAC19423;
	Wed,  4 Mar 2026 07:50:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772610620;
	bh=jYBgxHBKSrzORLOTAIs5siOxD+JvNIgj5Q3UqAteHXg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=F7K/eX9bT9AgsGQ423eMvmnxXx5tTxZ7usQQaEreAPzdpfQBarSeI89j6LNPRUtiY
	 OsbGtT2UDW6qv1Pws62sUc+SDSNFrK35dOr6rasyZuTLjxbLIFhAP059r5m8frSvHu
	 inKkexTSlv/hMw/43DKc+Cg+I69SCtbx54389SEx/Q32L/9M5mfjjmxgTr6pz0mjMz
	 Rt2CvSPbIc1hfz+PPQpWQeR2b8EF3Tduv3ZcnWrFo1yQ0mM971NUZu5YlpPtpeRLy9
	 WG03t41e22O1zcfaGMLBqDb7iFCBwz+QIdgE2BzRd2DIVTFbLMPnvZTWzxDTBANPUY
	 poQ6HVZebjhwA==
Date: Wed, 4 Mar 2026 08:50:17 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Linus Walleij <linusw@kernel.org>
Cc: Hans Ulli Kroll <ulli.kroll@googlemail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 5/8] dt-bindings: arm: Add two new Gemini devices
Message-ID: <20260304-quixotic-military-flamingo-ea3fb7@quoll>
References: <20260303-gemini-dts-fixes-v2-0-5b92ced841ce@kernel.org>
 <20260303-gemini-dts-fixes-v2-5-5b92ced841ce@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260303-gemini-dts-fixes-v2-5-5b92ced841ce@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260303_235021_239225_6FF3ADD7 
X-CRM114-Status: UNSURE (   9.96  )
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

On Tue, Mar 03, 2026 at 08:29:37AM +0100, Linus Walleij wrote:
> This adds the Raidsonic IB-4210-B and the Verbatim
> S08V1901-D1 Gemini devices.
> 
> Signed-off-by: Linus Walleij <linusw@kernel.org>
> ---
>  Documentation/devicetree/bindings/arm/gemini.yaml | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


