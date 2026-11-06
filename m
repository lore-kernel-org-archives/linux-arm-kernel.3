Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 280A4606A326
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Nov 2026 14:19:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=f/J0qb8U;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hJfA1aDk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=FImo0Si6aBUJrvKYxmacsgGaoJNjRjIi7dZYfg0r/e4=; b=f/J0qb8UQ9bpjsmbSQjRO74RTj
	nFYa3nanHrO2agkkrQ/J8lsB5FQlZX2eYKqZYCBfL3xfRbHxQVOyZHO81McfvtlH0QhZ6ChQa4/F8
	Qhg/ZaA3n9dP2rJYeoLlYTU0eK0iiJ7WLZIdC62/Tym8gdg9X2CuXnHMebc12be5HCn89qze6UVkT
	tFWj6K6zbz7oZPPvl3nAqFvcXpkyMDuCF/HuSiHokxNYblFDRzN69yCljAl1GpfQZ5daNrzxurOqp
	HhXOV+uYx0aSBEKsXG5U+V/pKOAyTrJsKk178v0JZCoa3IHlBq2b8doLndEoWFxUP0Eb070vt9ry8
	kiI3JPHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPKmp-0000000CcfL-1WEi;
	Fri, 06 Nov 2026 14:19:23 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPKmn-0000000CcfB-2zam
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Nov 2026 14:19:21 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id D368F605EB;
	Fri,  6 Nov 2026 14:19:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A72411F0089F;
	Fri,  6 Nov 2026 14:19:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793974760;
	bh=FImo0Si6aBUJrvKYxmacsgGaoJNjRjIi7dZYfg0r/e4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=hJfA1aDkwM9ReyQLQZP8cqOlSvy1h87gvRMqTjepz3+KDmLSXJgdKFLkiEnThBUNQ
	 yFrOdWj+FKJFL0F/ytYXlbcnN/Ld64cYCLhgfaL9oBZoWc8HCo5nNLGIUjWYkEkpMx
	 g46iqqpmAfudUA2pifkLwrjRj9wMTORA2uH+1Eq3xuQdbmBDxSNJpUgKr/gjvieTLs
	 FkeQghztvAnUBtiJfs7WGCstiOgV3VhrfWw4TW6cJHLF9mrtQ6nygNu7JmN0CebAnr
	 Jw+/WTFqBWcwE44AwiPzuaggypRfN4BcXdg0Aee2xHn8fitBKR/hfz/9d+KPEftIKO
	 ysTXRijEJpeCQ==
Date: Fri, 6 Nov 2026 14:19:16 +0000
From: Sudeep Holla <sudeep.holla@kernel.org>
To: Linus Walleij <linusw@kernel.org>
Cc: "Rob Herring (Arm)" <robh@kernel.org>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Andre Przywara <andre.przywara@arm.com>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/7] ARM: dts: arm: Another batch of warning fixes
Message-ID: <20261106-wise-ochre-lionfish-25efc4@sudeepholla>
References: <20261105-dt-vexpress-dts-fixes-v1-0-66615c3c8ec3@kernel.org>
 <20261106-outstanding-turtle-of-opportunity-9fafcb@sudeepholla>
 <CAD++jLmYJM3VhKN00CjpRviQ4Zfr394c2o3xqZPqEZnq9yz-ig@mail.gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAD++jLmYJM3VhKN00CjpRviQ4Zfr394c2o3xqZPqEZnq9yz-ig@mail.gmail.com>
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
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, Nov 06, 2026 at 02:41:20PM +0100, Linus Walleij wrote:
> On Fri, Nov 6, 2026 at 12:03 PM Sudeep Holla <sudeep.holla@kernel.org> wrote:
> 
> > We can remove vexpress-v2f-1xv7-ca53x2.dts because it is highly outdated and
> > relies on an FPGA tile setup. Replicating this environment is likely
> > impossible since the original bitmap files may no longer be available
> > easily.
> (...)
> > > Rob Herring (Arm) (7):
> > >       dt-bindings: arm: vexpress-sysreg: Add "mcc" child node
> >
> > I assume you will take the DT bindings via your tree.
> 
> Me too.
> 
> > Linus,
> >
> > Do you want to take this series via your tree or prefer me to take it ?
> 
> I think it's better if you do it because it seems you got thinking
> you want to delete some files, so then it's better if you
> queue all that in one go when you got track of it.
> 

Sorry for incomplete information earlier, I was actually referring to
Arnd's deprecation of few old ARM platform support series which removes
MPS2.

-- 
Regards,
Sudeep

[1] https://lore.kernel.org/all/20260914140821.1805449-1-arnd@kernel.org/

