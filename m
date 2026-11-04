Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD2CD606A330
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Nov 2026 17:05:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=kY+W/Dq6;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IUQJStB8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=3kGc/TdTlhAna5c/XIOgSyLjkq7Couqao11uc4WOjTg=; b=kY+W/Dq6NIEvBefLG+7Nxdf7kE
	pO40kRzm18bySQJlUhozfKmWJkVFel2heUfYHEKCtT7IHcRVmKBc69KthYZdOPznZFY972wf1xy1C
	Vg5v6olSX1t+7RvcSdUNv9Q3BHcvvRsOCH595oHdtGP/DxMJL5Km99wgFEKxYDLHKGW4imyMoG6hE
	qMJseo19md9zBJ42mUPfHA881FCZsXNH1SJm0UB765PbDvyAwSihLjC/5VMDMvZ2k77cUsjZ6AGlY
	6Pqo423M3WiouyiW/miI5KbHkn/zhJT5h9hHV0fP+nKvosECzyfc+PXMLT1ArDMN4Y/+SqYzSJMaN
	bQcaHFiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOeQU-000000068WS-1f4Y;
	Wed, 04 Nov 2026 17:05:30 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOeQT-000000068W2-3M1s;
	Wed, 04 Nov 2026 17:05:29 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 455B641A0E;
	Wed,  4 Nov 2026 17:05:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E48671F00A16;
	Wed,  4 Nov 2026 17:05:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793811929;
	bh=3kGc/TdTlhAna5c/XIOgSyLjkq7Couqao11uc4WOjTg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=IUQJStB8ZjzvNZVLPPeWp5Y7uiS5eTbo6dCqqwrFKLwoYkaTF9WqGfqx09Kv0s9cB
	 1XhX3bj6IpEB2ZF/TTHyWBz+Db6hmDjHOKOQ6oUH0FK9I9ZniLR0oNi913PW82jqPi
	 uVfAdrqi9KuWkxojbDGlick8bdWZHKCIRPfFSxHD+g56tHmrcYVNfO/ik225CcwDNR
	 qsINv46jOBuzi6Xc981oeLegIsbQLoSYlfgje1QkzhNP+mEILtw8eliChTVaDWwESs
	 JbuXej3F8dMVI6Su6taznVPzvOV7YheIIk+8BnU1pAJsod8ZvPYArrs0iqOFImr0N0
	 q/Fj544IgSGJw==
Date: Wed, 4 Nov 2026 11:05:26 -0600
From: Rob Herring <robh@kernel.org>
To: Shashank Maurya <shashank.maurya@oss.qualcomm.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Marek Vasut <marek.vasut+renesas@mailbox.org>,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v4 1/2] dt-bindings: regulator: rpi-panel-v2: Add
 vcc-supply property
Message-ID: <20261104170526.GA2198175-robh@kernel.org>
References: <20261104-rpi_reg-v4-0-3578e794ff45@oss.qualcomm.com>
 <20261104-rpi_reg-v4-1-3578e794ff45@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261104-rpi_reg-v4-1-3578e794ff45@oss.qualcomm.com>
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
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, Nov 04, 2026 at 01:40:47PM +0530, Shashank Maurya wrote:
> Add an optional vcc-supply property to the Raspberry Pi 7" touchscreen
> panel V2 regulator binding. The panel controller MCU is powered from an
> external power rail, which has to be supplied before any I2C
> communication can take place.
> 
> The property is optional so that existing device trees which do not
> describe the supply remain valid.
> 
> Signed-off-by: Shashank Maurya <shashank.maurya@oss.qualcomm.com>

Missing Krzysztof's ack.

