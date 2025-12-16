Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E144D5CC94
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Dec 2025 09:25:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K4MzkX6rVUZbTQ/gg0CCsh5uoNoVYG0ufDqPvf6dwU0=; b=uYiiAoixBBd9nxVyEe76ZI3RAI
	EkKW12B06i+uz0B1XP2revEJFzjDCgw0kpcB9jBGgONezrs0r+KgIl9raG/L/8DQu3FbhXTqlmwtu
	UV/GeNSUnCGQs2+3G4gwb7qDoPKVUKalaB4++BpcKmVamHth9wTKeNsxlMpkkRB7pXsZsp+sFGM8K
	gKr4j2+u0PM1ahT+qIpjNPNBd7Xcav89okjaB5Pb8wPvNz7JGCHSdl7gF91Jj/tFdJclltMDa6oEi
	eGJVI4F7zyL+cYmrMWWmyylm8Jsmoi0/zvY1xc3uB8WFClMaFX+dZE++UE+6z2TO9DSr4zDfB7BAP
	rbbV5hOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVRJV-00000004zKp-1bGN;
	Tue, 16 Dec 2025 09:25:49 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVRJR-00000004zKO-3Ra9
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Dec 2025 09:25:48 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C5B68FEC;
	Tue, 16 Dec 2025 01:25:37 -0800 (PST)
Received: from bogus (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 24F593F73B;
	Tue, 16 Dec 2025 01:25:43 -0800 (PST)
Date: Tue, 16 Dec 2025 09:25:40 +0000
From: Sudeep Holla <sudeep.holla@arm.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Linus Walleij <linusw@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: arm,vexpress-juno: Allow interrupt-map
 properties in bus node
Message-ID: <20251216-thick-zealous-shrimp-b7afb1@sudeepholla>
References: <20251215212932.3324144-1-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251215212932.3324144-1-robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251216_012547_042826_31D84640 
X-CRM114-Status: UNSURE (   6.72  )
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

On Mon, Dec 15, 2025 at 03:29:32PM -0600, Rob Herring (Arm) wrote:
> Allow interrupt-map properties which are already used in the bus node.
> 

I assume you will be taking this via your tree itself.

Reviewed-by: Sudeep Holla <sudeep.holla@arm.com>

-- 
Regards,
Sudeep

