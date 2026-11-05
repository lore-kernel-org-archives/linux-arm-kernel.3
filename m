Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40D30606A338
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 12:50:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=G7qjYScg;
	dkim=pass (2048-bit key, unprotected) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=OLHEmmrL
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=kIDzP0IDOJsWChOEyUPHD/R2zakQJaIiem1/u8B6t1E=; b=G7qjYScgdIlqKk
	CqpAVjgmck6Xxf7DDJYpCfWsvmnX5o1tHvnHpLUXeCbxXiotas0qCs3RwdzezuK9Xn1A5PuHXwqja
	Fri6Qc2SAAhBwZDT/caC/VXH4RLCWEY9na0IDuFNGQovMqNPQ1hj8Zxo6qCzVxPVYSPO55mCE/38Q
	hFvy8aWH9cvV3jNKubKoX0J2I3PhdpWb+EtpB105rBxYnmduksfVNwYAx5RAaO3SHxA4tnmiycEPb
	vlW9TzEyo6BzUgh9KL79sNojPAMWbWbMXon/iDSj/OwcGwyo5mI4MC+5ZNeK2broQc8yKWTTxmo4J
	VC7g2DtXo1zs6aUtfutA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOwuo-000000090lL-1xGj;
	Thu, 05 Nov 2026 12:50:02 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOwul-000000090k7-3OWB;
	Thu, 05 Nov 2026 12:50:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1793882997;
	bh=RlhWYfICEXqxRLXR7YbWZGm+6cKZIs9StBuE8vu18kA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=OLHEmmrL4SUw4QQUdUdJ6R1Yv7p69HUyEhKoJZG2LhtOVjTOcs+RqsZhB3zrZHs8z
	 3t/LUM6FYcDtt8OgGNvv4Pcp3XTWf/s2My28ZvVNk30Z6Dd45zgyrBupACbAJ3wHY8
	 8bfCjwq6jVxOwqJiGH5hwt1F+9KAo6jWj2UvKB5SQK94oBne/cvS1uRXCOT1KUCHbW
	 SmL+Efs+XBU4ysdYX6YxArtl4Gn8XCSL0N1ghvl1N/p+9vxFHo/h1s3FYuYD4RmX+y
	 VL97c9U44XyWu+iJe6BQcQpS+nknp1PgvHmvYk4s3yGNo2Ry0nGQj0vbQFsTCTxs9z
	 I50jvT9V7VZoQ==
Received: from [100.64.1.21] (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 97FE217E0163;
	Thu, 05 Nov 2026 13:49:56 +0100 (CET)
Message-ID: <8cf203c8-69a6-43e1-a12d-25bed35b79fe@collabora.com>
Date: Thu, 5 Nov 2026 13:49:56 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: input: mediatek,mt6779-keypad: add mt6595
To: rva333@protonmail.com, Mattijs Korpershoek <mkorpershoek@kernel.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-input@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20261105-6595-dt-keypad-v1-1-f0911f40d3ad@protonmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20261105-6595-dt-keypad-v1-1-f0911f40d3ad@protonmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_045000_033317_AB668477 
X-CRM114-Status: UNSURE (   6.88  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-12.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 11/5/26 12:29, Roman Vivchar via B4 Relay wrote:
> From: Roman Vivchar <rva333@protonmail.com>
> 
> Add a compatible string for the mt6595 keypad, that is compatible with
> mt6779.
> 
> Signed-off-by: Roman Vivchar <rva333@protonmail.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


