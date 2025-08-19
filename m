Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36DBACA0EE6
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 Aug 2025 18:15:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k5kBnlU0UIp4AhqJpbkP30L2WoVtOnTPatg4jjrlAjY=; b=jdfCiKBAj0s1S1/pIxcz/vx0ny
	CmPMbvwsePWph2vQG+AiyuWbVjnOYD5ikSBE1b57OMRKhyTtWgp87LDru9d0Qjkjwugz5Rjwoi+My
	JWXkLEG3paDgigCOc5SQY1nHPsqsdRM/bSf8lbJxSdRNwD5yUDHpO6HTcuNyHir7cd+Dq2Gu1XSdU
	CCR4duFjPLdUtDvfL+ze1CkIWmbQug4QC7e90dJH3rSerptToRePxHIXKlH4G2PMvPuDoLepHl5hi
	XTzevuPW7xTLtcoXnatQGrUMV9KvzrFSk+u7qa6H2LXuhL/fPBsvsq0bvyWPd2fqla3EFbg7Pt72v
	E7z/VQXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoQrT-0000000BEjJ-0o0h;
	Tue, 19 Aug 2025 18:15:07 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoMtV-0000000AggH-3M2N
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 Aug 2025 14:00:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 2A40E5C5D9D;
	Tue, 19 Aug 2025 14:00:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AFE42C113CF;
	Tue, 19 Aug 2025 14:00:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755612056;
	bh=v2bxLEdMiFhvVeDk2VKDc+laagxhg9z8Eu0qAxJIl7o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lmfdVUErvstxofMsyj58so3K6FN/i+YTaRTO5Jdsk3hoE2/J5nLYCgWa5YidwvM4C
	 seymARtPPdkn19XQuu0a6MCL/ACSKM/nJ4AQebb3Y1AjoGyWigt817XVq1bscEqDYy
	 1HxbrMmEo4xctC7SEyMD45hTgTqPqFXC/tJOqF9c90gvqt+cs+1LLW6y1Li8SknSVE
	 QoE2tS8VIeu7K6Z+EJrTxXtGPVE6AArjv7RqSBYWde89QA21Pqo9zquBJ81Nf1t9fl
	 45e7niWw65Fg3s/gvJwnSr7GTG9j+XmhnQuYGvjkels+cBANGm6iQlZP+lBKBd6KZa
	 gdrZN8G/Bay+A==
Date: Tue, 19 Aug 2025 09:00:55 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
Cc: David Airlie <airlied@gmail.com>,
	linux-stm32@st-md-mailman.stormreply.com,
	dri-devel@lists.freedesktop.org, Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Yannick Fertre <yannick.fertre@foss.st.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Simona Vetter <simona@ffwll.ch>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	linux-kernel@vger.kernel.org,
	Philippe Cornu <philippe.cornu@foss.st.com>,
	linux-arm-kernel@lists.infradead.org,
	Maxime Ripard <mripard@kernel.org>, Will Deacon <will@kernel.org>,
	devicetree@vger.kernel.org,
	Christophe Roullier <christophe.roullier@foss.st.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Subject: Re: [PATCH v3 01/13] dt-bindings: display: st: add new compatible to
 LTDC device
Message-ID: <175561205474.128167.15765669735400801632.robh@kernel.org>
References: <20250819-drm-misc-next-v3-0-04153978ebdb@foss.st.com>
 <20250819-drm-misc-next-v3-1-04153978ebdb@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250819-drm-misc-next-v3-1-04153978ebdb@foss.st.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250819_070057_888629_941ED195 
X-CRM114-Status: GOOD (  13.22  )
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


On Tue, 19 Aug 2025 11:15:54 +0200, Raphael Gallais-Pou wrote:
> The new STMicroelectronics SoC features a display controller similar to
> the one used in previous SoCs.  Because there is additional registers,
> it is incompatible with existing IPs.
> 
> Add the new name to the list of compatible string.
> 
> Signed-off-by: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
> ---
>  .../devicetree/bindings/display/st,stm32-ltdc.yaml | 30 ++++++++++++++++++++--
>  1 file changed, 28 insertions(+), 2 deletions(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


