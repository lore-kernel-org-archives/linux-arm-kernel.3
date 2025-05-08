Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2857C3ABBE
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 May 2025 06:54:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RioPm0xJ4W43VIZ298ljMriygcUBpD1F17cLUVA/coE=; b=AbHoGhs2gdZY8kPw7EV5+AMB2h
	kQptYUaZBSGd1XU/WBvpcxlp3S/9P2TSV6b+AQ+tqbS6Ih2CSCwAMfxBx2JRxf4/Ak+e4DAOmGHhM
	b9Ex00tg1uf81Fq4pdjmcfHRVtFLrT7fYXhvbJ1eNZnKvS9T6a441wqOy6uWfNTxNc0RZXEA13eD4
	jOfRrZ4boFddt6GAaOMsW795YbEBibIDy9mSfz5tv7LW5epyOSBxjJCtuPjctfMTZ9Hn1dc8kfGMJ
	J1nkdHeg5n24iEbe/eQKYAOajPr0dVJmcOIgIMQpQKaETGy1x7f5/ao0wkBFr38H2GWRXcbGQ03oo
	0PG2qjqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCv9Q-0000000HWF0-3Ks2;
	Thu, 08 May 2025 06:54:36 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCuzq-0000000HV97-2GaQ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 May 2025 06:44:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 9C19B5C61F9;
	Thu,  8 May 2025 06:42:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0624EC4CEED;
	Thu,  8 May 2025 06:44:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746686681;
	bh=Hy0g0Il8Xl3COvvl59eRO9qYPHsgZeK09RVf7oNgihY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qHP9aykz1rHNs6oq2hKLyC5C2+8wP9LG4iSrr9nXjIyEhmw9OFG9hQtAqQLIXB20N
	 o6sIhgvbqs6cHu1/gFRf3kB183UzoYLtyGKL4t0OdefJ04kg3sNXLlJhnkWH/OgjHZ
	 3IaFgb4oYDKN0mOKWZqaMHR+ndsS45T5DYyg0Op8GKDqrTLupVLHDrojyKPa6isDH9
	 SiyFNIGTHArebJytVBbTZEtVeui2PhCme/4oTyAYq8HSx/nAJGmNOiBA2iEluf6g5P
	 1wg9zO+DuTQoFPWfHLCBZzWCccoL3yr9WPiRgQu0V9mvlNfi2dVFEi0bshRZ06B4fc
	 nXdrcIHiCw5tw==
Date: Thu, 8 May 2025 08:44:38 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: soc: fsl,ls1028a-reset: Drop extra "/" in
 $id
Message-ID: <20250508-determined-terrier-of-tolerance-ad0ab1@kuoka>
References: <20250507215903.2748698-1-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250507215903.2748698-1-robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250507_234442_637697_814B856A 
X-CRM114-Status: UNSURE (   6.84  )
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

On Wed, May 07, 2025 at 04:59:02PM GMT, Rob Herring (Arm) wrote:
> The $id value has a double "//". Drop it.
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>

Fixes: 9ca5a7d9d2e0 ("dt-bindings: soc: fsl: Add fsl,ls1028a-reset for reset syscon node")
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


