Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E25AAC77B7C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Jun 2025 22:21:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jOA4rDMqMffEQYE7J9O/A/HB1vCyqDIErOGnGRV/yO8=; b=vz+FPWREgP123HIn2AiFODUmVk
	g46UMEgrMe77zUAFyQpvFEHp+LgS3KNAruZ5d/tjZWLSYs3cFU8Qtb0k5QhRU887OMjFV8tI8Ap9w
	+ZbvvcQwlvErP9BzOBpiUYJGwt4A6pfEuwwHg2e+4r1XnoLieZtAUd18M5A83sbu/7BwsuhzMHJMP
	YLXfpKbveUyQ5R9pHmaPQSkRqhl0RDMr1wvOFg32zFoH4dm4HkVp8QkI/+gmpmwsLveoK036+urs6
	rvR1tQZSRP2Kgd3HOkIVrRpzS6I3m2po1hC40Q6wb1DTNndh+7TfZQui0X17oXuhqFujXLyNm7XSs
	eJ50VWeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUYUQ-0000000A3Z3-0Vxt;
	Wed, 25 Jun 2025 22:21:10 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUWAm-00000009mzQ-1RvA
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Jun 2025 19:52:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id BB37849D30;
	Wed, 25 Jun 2025 19:52:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73C74C4CEEE;
	Wed, 25 Jun 2025 19:52:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750881163;
	bh=VDiFnUxzpQuStKAHouo51b9DQbguX6DQSHvm/hd/xaM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=seDyqdw1PJyKNbIhPu45Et06m6kzdAoVPPVwGA4LGIRHvchPiRZ9ODsLXKvcJcrLk
	 pSoj+DrmWFvbqFEZtv5RQ5V30UjtwuGoCtsNcCIh2zKFvwQQ/s5x88UnPqBJIwVP+t
	 xe4xflhWUVB+h9fm5VABSduTzYtI6plFNNV6didbcpYOl0WUjXU/IKWWvDWi00jUsy
	 oQMgVmJ/tb9+VJFDD0/SwMB30iasbolNySCZJjjmAc6zRnG/+DlxXYhuYUxbXjrVq8
	 ZfKseo/ULwtZwf3zcoT7/rcHi/kske3yf9fF7ahLnpg2YHPEz9jf6j1pArLJXfL18K
	 /TIiewH4Inj2g==
Date: Wed, 25 Jun 2025 14:52:42 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Antonio Borneo <antonio.borneo@foss.st.com>
Cc: linux-stm32@st-md-mailman.stormreply.com,
	Linus Walleij <linus.walleij@linaro.org>,
	devicetree@vger.kernel.org,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Conor Dooley <conor+dt@kernel.org>, linux-gpio@vger.kernel.org,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Fabien Dessenne <fabien.dessenne@foss.st.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [RESEND PATCH v2 5/5] dt-bindings: pinctrl: stm32: Add missing
 blank lines
Message-ID: <175088116219.2109196.794723987719315841.robh@kernel.org>
References: <20250610152309.299438-1-antonio.borneo@foss.st.com>
 <20250610152309.299438-6-antonio.borneo@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250610152309.299438-6-antonio.borneo@foss.st.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250625_125244_406438_F809426F 
X-CRM114-Status: UNSURE (   8.87  )
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


On Tue, 10 Jun 2025 17:23:09 +0200, Antonio Borneo wrote:
> Separate the properties through a blank line.
> 
> Signed-off-by: Antonio Borneo <antonio.borneo@foss.st.com>
> ---
>  .../bindings/pinctrl/st,stm32-pinctrl.yaml      | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


