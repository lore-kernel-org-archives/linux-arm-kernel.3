Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E10D5C61CE7
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Jun 2025 16:56:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HftJddo3FWvmWayu0Jw1+BrgjmbwvjbCIHNgV4/Xs/c=; b=bNX+PH/xGo+rCKTB7DKbAcqVUL
	I4zF1iK0DOJj6Z163Ml7RLkw7b4A0nC4gLykumPx2Zje474JwqIqYXic0/sss8PTZUvI8D2SwOILL
	X5M2Q532v9vQksjPfC8peodT9/u0ua8u/mQ2FplL+JmVngb8Q89c0dDWyPNZUFAi9bZ15bpMyjs5Q
	Hprogw1dPfbnwJOoERD8gUVx6eW3EVYVEO8DksiaxQUHVtHna7+5kHyR1VEzptmzJJk8yt+bZ/BZg
	ttDss9l7gEJaGdK/wh2zWxuCm4t57tJtG2l+zjoVqJxR0oNoYHS1A1Og71JI5kGlXXbq7J1EFzsCB
	Rb3/i+Kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNaML-00000000gH7-2ehQ;
	Fri, 06 Jun 2025 16:56:01 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNaKE-00000000g8h-17TT
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Jun 2025 16:53:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 499C744EAC;
	Fri,  6 Jun 2025 16:53:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3404C4CEEB;
	Fri,  6 Jun 2025 16:53:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749228829;
	bh=THcPoC12IS1aNiP83TwV4A0pYFP1HxQtv158X0rPetw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XqZiNuPL2J1wV7m7uAqxjXFSAFfsrDOzIPFasQyZgFA5XXVdkxOwZqRd6Hei5VHUx
	 aDJnLxclyH4xzOUZzHn5zrY395DoP3a6oEf3GLs/TlNSPBkqge9UydXzB0BqURQ/YO
	 fk0f1vkcdj3fhB6dkSpL0ueIHnM5LiHR5eJ0NK1oQG5sOeE7d3/e3KSG/qXhFqLaGR
	 vwbDGsalBTRcGy3X0WPvAvSS8xdisSE5+BOJOE2Vs/d48Dv11U56EKKFNgyPUsWuzV
	 tWt/SjKMUG4DQVyxD70myUO9W5qxMNJ6B1I9O8252BAz2rvRJBnzTk12Hs4m6cMhSi
	 cCU04D8sETx3A==
Date: Fri, 6 Jun 2025 19:53:45 +0300
From: Jarkko Sakkinen <jarkko@kernel.org>
To: Yeoreum Yun <yeoreum.yun@arm.com>
Cc: sudeep.holla@arm.com, peterhuewe@gmx.de, jgg@ziepe.ca,
	stuart.yoder@arm.com, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-integrity@vger.kernel.org
Subject: Re: [PATCH 2/2] tpm: tpm_crb_ffa: maunally register tpm_crb_ffa
 driver when it's built-in
Message-ID: <aEMdGXXBSym7cXmK@kernel.org>
References: <20250606105754.1202649-1-yeoreum.yun@arm.com>
 <20250606105754.1202649-3-yeoreum.yun@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250606105754.1202649-3-yeoreum.yun@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250606_095350_322571_1D3C33F2 
X-CRM114-Status: UNSURE (   8.55  )
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

On Fri, Jun 06, 2025 at 11:57:54AM +0100, Yeoreum Yun wrote:
> To integrate tpm_event_log with IMA subsystem,
> tpm_crb and tpm_crb_ffa driver should be built as built-in
> (CONFIG_TCG_CRB=y && CONFIG_TCG_CRB_FFA=y).
> 
> However, this could make failure for ima_init() gets tpm chip when
> each initcall function deployed like:
> 
> 0000000000000888 l       .initcall6.init	0000000000000000 crb_acpi_driver_init
> 000000000000088c l       .initcall6.init	0000000000000000 tpm_crb_ffa_driver_init

The only failure I see is the patch 1/2 which changes init call level,
and leaves kernel Git to a broken state.

It breaks the famous "zero regressions policy".

BR, Jarkko
 

