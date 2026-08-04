Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 754F9C55843
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Aug 2026 06:31:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:Date:Cc:To:From:Subject:Message-ID:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=gi9d0l3rgCR+RUqTo7TMdUVuSdReZ3fEmqQNtlJwxzA=; b=pORgafonOORmsbNe0OW3VyXWHP
	gsKdGrVWQuz7xsfXfuy10F/xqsRadxGY0xCE6FP517nDnxWoPHSgtHVAujXsZ5mtJhl/oR0NdeaE4
	yZImBwGulkDvPf9LSMLN62GGgHZYG2kGqBgOZ6hEWTQXLOBSt1SnsX0Pbm7bWFn4Pn1KciZLbNMfI
	WPhoWUtYOHQ2zklInKo02Zc0Y5bmNnPz8/DcBPfAbEX1OCKAnOPutA8VVVIBUyTL/54zaGU434zNL
	zhhJ4LrnAHq42xQPtOfrvtzBiycBr23dgpofUQ/SMDWhS+QtYCD3UFX1yZ5h3X0zNCVdeEbeY08TO
	plC9eRYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wr8g2-000000017OB-1zDc;
	Tue, 04 Aug 2026 06:31:02 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wr8fz-000000017Nl-2tt6
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Aug 2026 06:31:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1785825057;
	bh=gi9d0l3rgCR+RUqTo7TMdUVuSdReZ3fEmqQNtlJwxzA=;
	h=Subject:From:To:Cc:Date;
	b=bO5aAQtkO8KBjSXY3sQKjQsvvIPlcQi9EjRM33BJZ/FYZYbrvwA2HU77tMNG9Tb4Q
	 0jcATX+R9Kwvu1y07YpMt/7HHYAFPDHph3DHWaVqSoD0few94ATqaY1aU2hdnUN7Z7
	 iyjB/b4aq6YpC1pWNk5clF/tkwwyNPXi13oXEeIgNHFESD8gnps7UhbkAUfo6XZhfd
	 eEhJy28ZV4suEgL8XnddRO+3+fFpbLvSJj89JuFSnDDtYiUl/310Ge7Ik8FSDZ4dMZ
	 1MbW47E2HVwiLzPW9qClezNNWXBCXXmdS8osHqMf9UAmwEEI06IJc1wwh6TZ+sy3g2
	 48Z63TvNBIUhQ==
Received: from [IPv6:2405:6e00:242d:870e:1a3e:8259:e4fe:6a28] (unknown [120.20.146.186])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 60016655A9;
	Tue,  4 Aug 2026 14:30:56 +0800 (AWST)
Message-ID: <cc2b296319ac4b52602c891ab04807bd18a32bd1.camel@codeconstruct.com.au>
Subject: [GIT PULL] aspeed: Update MAINTAINERS for 7.3
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: soc <soc@lists.linux.dev>
Cc: linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org, Joel Stanley <joel@jms.id.au>
Date: Tue, 04 Aug 2026 16:00:54 +0930
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260803_233059_917385_008E6403 
X-CRM114-Status: UNSURE (   5.86  )
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

Hello SoC maintainers,

The following changes since commit dc59e4fea9d83f03bad6bddf3fa2e52491777482=
:

  Linux 7.2-rc1 (2026-06-28 12:01:31 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/bmc/linux.git tags/aspeed=
-7.3-maintainers-0

for you to fetch changes up to 6cdd8cbbf89611da6c948d58daed1c53f4bf8321:

  MAINTAINERS: add Ryan Chen and Billy Tsai as reviewer for ARM/ASPEED (202=
6-08-04 14:06:19 +0930)

----------------------------------------------------------------
aspeed: Update MAINTAINERS for 7.3

Add Ryan and Billy as reviewers for ASPEED SoC patches. I asked both to add
themselves to increase ASPEED's visibility of upstream changes.

----------------------------------------------------------------
Billy Tsai (1):
      MAINTAINERS: add Ryan Chen and Billy Tsai as reviewer for ARM/ASPEED

 MAINTAINERS | 2 ++
 1 file changed, 2 insertions(+)

