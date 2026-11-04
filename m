Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F2D4606A33C
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Nov 2026 14:51:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=cAc6jfyU;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iJWJG0Q7
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=svOy+zGHVcdPtGrvtxxDyVEeG7cGnLz/gXyFgaKtaD0=; b=cAc6jfyUWXeNFO
	Snu6zauHesh3V8/2So+tuFSUFTeoptPeCyoTcVhDX9roA27mabRVr84LwleyhHbAdLtdD41PNBHBP
	er86+XshMe6wBcEicY02pbyU3zFehT5gQGdyGtoZ1oiRrDXcJHbUMHGzPr2hiOKe5GskMW1L7PL1P
	A7Ro7l+UFr8vkgSUeG06ySbmmVVihRFtdS37RRKA3fOrveFeZJyvKvVEgJgx/jRibm9jDU0CMEb4z
	fIJHih98NOh/wEjkWDWPXN80g7NEiktPFD5BTgye18dt7T2QUbSu2Pv9w4H8Cybjdlox0HBfsgut2
	bgxvBQs0YPOSWKjeK52Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOcKI-00000005geR-2IrD;
	Wed, 04 Nov 2026 14:50:58 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOcKH-00000005geF-00pe;
	Wed, 04 Nov 2026 14:50:57 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 16C2160A8A;
	Wed,  4 Nov 2026 14:50:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52FD21F000C1;
	Wed,  4 Nov 2026 14:50:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793803855;
	bh=svOy+zGHVcdPtGrvtxxDyVEeG7cGnLz/gXyFgaKtaD0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=iJWJG0Q7W1l6azSsYDSq5vCW6Eju7uEkBt5YwV9zZNskQYjiIAWYi6vjNcZd9ZpBM
	 UCjd6e3WnHN5i0pbnxcrHI3NxC5rS5R9wby3Kn1rdY1ANhjaNU76Ch1TXTUnySsCwJ
	 d5SAd/pkfFlGbiHm5VgDz7YpzxFs254KhEmz5hM/8eSqlCCp9q/H1vm+hSveDz3CAL
	 Xeb9WQTUkaaW+oGKEdodctPK0n1K0PeLSxVongMvguA1KYQPxALMt9EtbxoEnZklLw
	 GuWsaIzLfyWoBa6AZnMyHKqlTLCDdh+8eprTqBIKj8wkAe/FZHAL2+tO4oFKMKHkPI
	 XaXlSxeTGzG0Q==
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: (subset) [PATCH 1/2] ARM: dts: mediatek: Correct white-space style
Date: Wed,  4 Nov 2026 15:50:42 +0100
Message-ID: <179380380614.180018.397702707593418404.b4-ty@b4>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260801210230.383532-3-krzysztof.kozlowski@oss.qualcomm.com>
References: <20260801210230.383532-3-krzysztof.kozlowski@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Developer-Signature: v=1; a=openpgp-sha256; l=543; i=krzk@kernel.org; h=from:subject:message-id; bh=x5HsLXS0bKM72nb91uBkXiIG5mm31kpwC4VdQSHnrRQ=; b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBq60ZD06u1G1n/zgc9/oR6+85pG/IfJiym/3MSi EiU318L0gqJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCautGQwAKCRDBN2bmhouD 11N4D/4yNeoNn2rzSwthfdq41ma6IfRgjAUZ0jT7sym7LAkp1Rjy4vp2VDu1IFcLyVwmHAs+vgj CBEQHvngYF3d+Q8vgZxdIhIDi0G3qXCIS/woM2AoINk1XmHvIpNFy10bncKRfaG3tiA7SyLwsUM W1RjrYheHmfX8wx1Yep+cgSOQU5Hg9x2uawid7LBB4INWdOPxWtanUaO6KTr1E+YaoN7XOm9VTI jbX04pN4In4Qobyn79HXgeNo6UOWt6JJkmywtkX8wiXIxEi+RvPs29mnJyN+qUamCIQ6Sm18wQl lip3AYw5LN18qBJ0+XsBapE7747FPjTwhbXHC83amt3rDmUFy7mdSHCdwl+K0vrw9kz8KRErarz 2AjnQFCxcdecjGZPjOGhqx9XsJLIuMfqPRBgcQG9CaFOzBSnCskGogNq+zkyU0VOxeuqkjkOGbC 9O1bhur8OJKZ1FrGfFws5839KkcqsFBptGzA0hJEqak42Z5GYbGlW/tOZcd3iooidmV8J8TqZjV qggQP6yqQtbFPTDixHCmnBpq3oRQI6Nr2ESzQFDx3IdXzMFMyxyy7Jx46zvPngAen57Mt6U1bFN 8pGjTP+c87ybgyPx8MATaN8dDR6fAhwkFfClLcEifxgNFoi1FZLang+lnPlRikf0sAGmi0aUoN/ I1RX1mzKmln6Ap
 Q==
X-Developer-Key: i=krzk@kernel.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
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
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


On Sat, 01 Aug 2026 23:02:31 +0200, Krzysztof Kozlowski wrote:
> Correct a few white-space issues, like redundant space before final ';',
> which will be flagged by dt-check-style ("redundant-whitespace"
> warning).  No functional changes.

This is waiting for three months without feedback, so just picked it up.

Applied, thanks!

[1/2] ARM: dts: mediatek: Correct white-space style
      https://git.kernel.org/krzk/linux-dt/c/e0f010b24f4e29761b9d7a37103928f58ef6c21a

Best regards,
-- 
Krzysztof Kozlowski <krzk@kernel.org>

