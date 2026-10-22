Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 455EC606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Oct 2026 19:09:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=MZt6di9H;
	dkim=pass (4096-bit key, unprotected) header.d=alien8.de header.i=@alien8.de header.a=rsa-sha256 header.s=alien8 header.b=hMx3kx2u
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=d+IRbs3FeqA37fXeROEiKyHno8d9zy8yIxQWW2C+tuY=; b=MZt6di9Hd5PiTQvnGbpXqhsnCk
	meZiTHPx5hMY5g2z7ysfIigeIw15Ac26p7l8rhmUjPcNiYVaJ1Qhtb2V4qwLzpdfeo7loY7jpRaWj
	eNZ6e4xBZRWx9/yIm/vE1RjrvStQn4QtevAKZ2llcQXj0ZK7aJ6pywDEFD6s7Od2gGV66VhAacUy3
	mLXE1h6FP1PL9wfgmowm4yheuiU81CE36U49+COTyY3lM7YwHgeGOSxM3QZe+5iRUtQuLRQq5Kf8R
	AP0VHL7aCpI8ATFQxlf2w6TLRLdmKuqJ9eVszXocxqygoPZ0u4pp16NfhaDtiJtC0+A6g3GquYTfp
	c8og8ahw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJy9o-0000000EnAH-1uEd;
	Thu, 22 Oct 2026 19:08:56 +0000
Received: from mail.alien8.de ([2a01:4f9:3051:3f93::2])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJy9j-0000000En9j-3uUO
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Oct 2026 19:08:55 +0000
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 2540740E016C;
	Thu, 22 Oct 2026 19:08:43 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id QVTxtbd_px1P; Thu, 22 Oct 2026 19:08:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1792696120; bh=d+IRbs3FeqA37fXeROEiKyHno8d9zy8yIxQWW2C+tuY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hMx3kx2u5Yv12yYwRnZIj8ko41SrEY0/Bo24yD1IkaXB3w0Cduv/+/mZALYiTB1c7
	 ljjfmrxGeDxztfA7wvUouPo7jX29EoogFB3E4lCS4jQ8D52zyU62aHlDAlJAs1GO5X
	 Gqyg+Csp7RMyGnOeVI1L0OJodlzLQ52GA0ajToo8k+DBUjpRRzVsi3eMUWjfAQxNwp
	 3LmFfL6H1eDU1EDO9Ixj6jX0p1x/ThQfPKXHEpNgFUAS7Qn20cMOD715Lbw3XO79FH
	 adaQ3dlCrkNZu+IcSTHZW849r7wmXSICNIF2yl9TYCzQTodWgcYqKuJBX9Da/xeyt9
	 DzDAvwtI6/PwCNVaCM4TMMWNNt5jvXQ0yt4AUTbQ+NEeWMwAO8+k9Vx8kguPHk58m0
	 FFlWKMwpgsJQ6J97aAdrFKQcAN0N9Fe5Dbpf1LWhd1gGcpBbP0SreR2Nqj9i/SDHcO
	 vsl9S1wNoXpSLNG8/60rkaFfEQRl6oPrWD2YwB/c4H0lX77G2c6dNVEqTMmS1sirxw
	 y0QmbcRQjNu3D+20Vx9kkvi43ZRkuM08HJvV4Hs5BqhipIVG6y+Z2+nuBkCWqZUxzl
	 Ukr+sL/72S9yWdkXaQBA3XEatB4/zUgEqiORrYh0k+vVOYPPG6qhkuxpYgRIrtxFts
	 3ZcV3/WTjJYy2zQ0cM0Xzm+Q=
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00::e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 5237B40E029E;
	Thu, 22 Oct 2026 19:08:24 +0000 (UTC)
Date: Thu, 22 Oct 2026 12:08:21 -0700
From: Borislav Petkov <bp@alien8.de>
To: Ryan Chen <ryan_chen@aspeedtech.com>
Cc: Stefan Schaeckeler <sschaeck@cisco.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Tony Luck <tony.luck@intel.com>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-edac@vger.kernel.org" <linux-edac@vger.kernel.org>,
	Borislav Petkov <bp@suse.de>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v5 0/9] Add Aspeed AST2700 SDRAM EDAC support
Message-ID: <20261022190821.GAatpfJYsT2fqKhk3T@fat_crate.local>
References: <20261007-edac-v5-0-5c31fc5df4cf@aspeedtech.com>
 <TY2PPF5CB9A1BE6C09C55652B1A6AA68725F2652@TY2PPF5CB9A1BE6.apcprd06.prod.outlook.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <TY2PPF5CB9A1BE6C09C55652B1A6AA68725F2652@TY2PPF5CB9A1BE6.apcprd06.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261022_120852_579324_0275D4D9 
X-CRM114-Status: GOOD (  16.68  )
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
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, Oct 22, 2026 at 09:52:36AM +0000, Ryan Chen wrote:
> Hello Boris,
> 	Just a gentle ping on this series.
> 	Any feedback would be appreciated.
> 	Please let me know if there is anything I should address or revise.

Lemme give you the spiel since you're new :)

From: Documentation/process/maintainer-tip.rst

Merge window
^^^^^^^^^^^^

Please do not expect large patch series to be handled during the merge
window or even during the week before.  Such patches should be submitted in
mergeable state *at* *least* a week before the merge window opens.
Exceptions are made for bug fixes and *sometimes* for small standalone
drivers for new hardware or minimally invasive patches for hardware
enablement.

During the merge window, the maintainers instead focus on following the
upstream changes, fixing merge window fallout, collecting bug fixes, and
allowing themselves a breath. Please respect that.

The release candidate -rc1 is the starting point for new patches to be
applied which are targeted for the next merge window.

---

While you're waiting, you could read

https://docs.kernel.org/process/submitting-patches.html
https://docs.kernel.org/process/development-process.html

and you could even help out and review some patches yourself. That would be
the most awesome help you could give to folks, and it would be very much
appreciated by maintainers who are drowning in patches.

Thanks.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette

