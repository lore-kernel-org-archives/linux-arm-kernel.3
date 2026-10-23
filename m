Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AE63606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Oct 2026 06:34:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=mBpMDRse;
	dkim=pass (2048-bit key, unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=jI4hJIO2
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=uw96e8wxJn4dRmmYbzz6TU2vxUmejS4+KFRn+pnou54=; b=mBpMDRseXdCey+
	nIUhxSwpVaFvWGDBeX4GBcCW5RihXHWCEyyNFoKfzD4i6iqBqOdgWDXLK7KTGNRZXB4s7R9MELAaD
	H8iarA2/cz8p+P9CpDFttuTk9cOpP9FLtPjx43Rw6WkDx+pCs6gE+f1amJohlIR6CrobKfYc7HaKw
	nF+U/7zUIKXhmdaFu7TucVYe/DVNNNG9FMZo+7/jJ9o5WFbE334lTnK3CVQIC7gsUIM0jhy6UcCZN
	dyNje//hnZv65iiONvc5T1ZVezG+t25ynCBHawN9gEvrUodkYeS9Njgey49aMPSpM08lolCsaZsh+
	7uTtv/pk3zJFtHELaFsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xK8qi-0000000FZm4-0Ueu;
	Fri, 23 Oct 2026 06:33:56 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xK8qe-0000000FZlV-2vDa
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 Oct 2026 06:33:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1792737226;
	bh=uw96e8wxJn4dRmmYbzz6TU2vxUmejS4+KFRn+pnou54=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=jI4hJIO2SpFbTa6a/xXNcbZgfUBwadU86IGVap5dP6Byi7M6nGFiAXg7pIBc4izeL
	 hrArl7CTP5kcpnRgw6iWhqQCeIYGiFc5fc413gzfLagIfttLPLS+8WPfVbVoiAUdQG
	 fUok7Yy7kd3VnMM2FXnr5NDeu6J+3xJz/XN9O5D4ghwO+wf/C38fV562uJgkukoxl9
	 t8/3fnUk0ZQ3zj/rytOOJsD0TvSkFbFp0ytsiPIl2awnIM8Ffx4pDNiDO1jsbFlloW
	 XA8furCsfhg+ziBpVU+alqMDJ8NJ14pM7sURDZ2uRYpcZDGjCtbJd8m0Zi/AZrh0Nm
	 MLs6HVQzCKYoA==
Received: from [127.0.1.1] (unknown [180.150.112.139])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id C82946C53B;
	Fri, 23 Oct 2026 14:33:44 +0800 (AWST)
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Kyle Hsieh <kylehsieh1995@gmail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
In-Reply-To: <20261016-ventura2_initial_dts-v10-0-a546659a084b@gmail.com>
References: <20261016-ventura2_initial_dts-v10-0-a546659a084b@gmail.com>
Subject: Re: [PATCH v10 0/2] Add Meta(Facebook) ventura2 BMC(AST2600)
Message-Id: <179273722468.1026112.15880414807402176715.b4-ty@b4>
Date: Fri, 23 Oct 2026 17:03:44 +1030
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261022_233353_811026_3C59162E 
X-CRM114-Status: UNSURE (   6.67  )
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
X-Spam-Status: No, score=-9.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, 16 Oct 2026 16:50:28 +0800, Kyle Hsieh wrote:
> Summary:
> This series adds the device tree for the Meta (Facebook) Ventura2 Rack
> Management Controller (RMC), which uses an AST2600 BMC.

Thanks, I've applied this to the BMC tree.

-- 
Andrew Jeffery <andrew@codeconstruct.com.au>


