Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B113606A31F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Oct 2026 21:48:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ZRIAqFdh;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=J5dhjrRz
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=SeYJzOStxDcCY5T2FRu069D80kN/5wtqcCKwZQpFtxI=; b=ZRIAqFdhpANzHv
	js34fbmcTH0hOcAJ4hgvl6JJXv3TAwKb6tsrXwkL3m4Oru0TJbE6+YrEUr3+1Ceskegv0I8l2kSZa
	38IRtap1HBt7hupUl7tsn7X4nwBo3WtmjLF+D6OOoxs9AGhwd+ds6ngJgGagPgAT+bb+zEqn68ild
	0Tygk22Lrt5UNsKOUkj4IfWmwynomuY2ehecQAeJxX/4vlPAGHfgQFJBN/xs2E+t9Xl0dSNvlxXsw
	RLaB1UZ5vo06Vg1W+UEyR8GHnuK8kNYx87+qI0DIxuIsODw5I7aQIzm0nwjHHhqMM0LSZQvnj7XKN
	nFb3PKOxlAO6bHXrfInQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xK0eV-0000000F1bz-0r9h;
	Thu, 22 Oct 2026 21:48:47 +0000
Received: from mail-vs1-xe2f.google.com ([2607:f8b0:4864:20::e2f])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xK0eS-0000000F1bb-2NH4
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Oct 2026 21:48:45 +0000
Received: by mail-vs1-xe2f.google.com with SMTP id ada2fe7eead31-7cc603a168fso98764137.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 22 Oct 2026 14:48:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792705723; x=1793310523; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SeYJzOStxDcCY5T2FRu069D80kN/5wtqcCKwZQpFtxI=;
        b=J5dhjrRzCRfjnrjnNgETWCs7Wgo8/4NORkWVq3ynycTeAAEmAfBMhMm6EgXu/meKNe
         1jnsHt3ZLtdY6XBb7huMymHTwFm/GN88G0LNiJZCGv7AC/bxNBDxCyqM2uDuvjw8oS08
         vsLOnviyLRJCGngyr/9tM6Sdu27LdsLnDdBQDfWdoszwLQkgzxxOvysLVMz/tyBM+VuK
         l/9bfJtMuOSPWy3x6O0HbZoo03oTdo50YA7h9DT42cQdaHIhK216XVvVpHq9G9iqkDx1
         wowGza0dEXXGLBxoPkX/aRKz6eilLd9gWPuy4WW1djLk2R0qHdgqnew5w2n+6JsyFaGO
         /OKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792705723; x=1793310523;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SeYJzOStxDcCY5T2FRu069D80kN/5wtqcCKwZQpFtxI=;
        b=KxrWHHYvS4U3BVZyahZqSuluExGNelbRz7seRm4ygzfF6x/78BU14X6YKfB9eCNUo/
         muW3XwkY5OIe7nIQwjHplYCJTjYkN0Yk45dlawkMFpv7iUQnhB+9Pv+WaU5FUR7fMVnF
         zq1Etm35i0t3VuXpqkBFEE0s+oA8vU+JSbOMZ+Focw5vS5xAVzP3niQo43hA/P2pOBkv
         QR1uZc4+Vwf2c6haK+8sc3uTHVymiZERLwfwxbmyrHWSLey+Xabb7iaI1bmajJL9JXOQ
         WNmeRyoGGrCMr0VlEnWkmgkA/qWhCrPbLnwET0MyLZtoPEHaT/Hkw9A5WnxM5k24FthA
         pumQ==
X-Forwarded-Encrypted: i=1; AKwUvBz7HihAqadq8Lt0EhIJBXCMXqtgGbri9v53KnNj85t89rPRCDXjdVZGLXz1bn+HL/hOgFYlkI1cAKHaWyztMpiD@lists.infradead.org
X-Gm-Message-State: AFq9FYJz1OUGC4fzZ+1UvXLOnuseYS9uj7VjHdc0V3zXaHSR1Jy2/g7V
	8f4U/xvw+ucgFLnT5VqA//Zkq1kLqGZux3ROC7MP0A4EMiHB8RKuWLOY
X-Gm-Gg: AYBFou09gxx1SbEWkgjhIBfMZ1Qv4nbDPZTXRKnRS3Q8TyBEcP9d5usy3EPsQODKv4P
	9f1zC2HIvj11JOE3c2GX2fMnqf2qKBZ2wFyb3O/WuEgZ4/NK/xLOhRKeihCfs3yPrInj67yPJh/
	I2x+VtEM1H4TrvQdbuUOSEbPivif8xot4DVWmY8fih6iwbBGreqIyWSIIpEkmlwp9MUsJLseDx+
	52R4W0gVpw9judwNdd2UUwhlRMoh+gjoY9vS+C7S2NAmaYx9ciWtDaNcrG5S7eNcSFodwZ5r/qG
	7gB9wvB/mQtFf4Vauhg3LuEfxiRXvSrxO2NZVnCk34tqTD4IdYhNUSCQ2Q+BjIqUmWM462nrknD
	4DMUd1wu8unJ+1dfxZPamEyOkFIh6PuzHYUmaMs9vVkeim1jYUYuvRvXTaMPFsQ4OG3olI85mUG
	VNprAbRVJM8cBtumHNCVylLCKrAAhJdrvYWWsLOZDLKarbWRWUuF5vS7CuvYRv5QiuK8DCKibV8
	R0Q5Dcncc834KDWkvkiVR1nzw/yNTocyYXBrVStOTRhLLbVb41OOWv+gxTulSjAafyuVIkx4KDW
	A1j75dS47S8RFXGgw0SA
X-Received: by 2002:a05:6102:3f8f:b0:7b3:8f0a:f76c with SMTP id ada2fe7eead31-7ccc32f27e0mr325464137.13.1792705723097;
        Thu, 22 Oct 2026 14:48:43 -0700 (PDT)
Received: from Biostar-A520MT ([187.94.15.233])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5ec13deaba5sm443786e0c.1.2026.10.22.14.48.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 14:48:42 -0700 (PDT)
From: Breno Rodrigues Alves <breno3011alves@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>
Cc: linux@armlinux.org.uk,
	Bart Van Assche <bvanassche@acm.org>,
	James.Bottomley@HansenPartnership.com,
	mkp@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-scsi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Breno Rodrigues Alves <breno3011alves@gmail.com>
Subject: Re: [PATCH v4] scsi: arm: Convert acornscsi-io.S to C
Date: Thu, 22 Oct 2026 18:48:15 -0300
Message-ID: <20261022214815.86306-1-breno3011alves@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <871p9h1kc7.fsf@trenco.lwn.net>
References: <20261022183658.58090-1-breno3011alves@gmail.com> <20261022185224.60700-1-breno3011alves@gmail.com> <20261022185224.60700-2-breno3011alves@gmail.com> <871p9h1kc7.fsf@trenco.lwn.net>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261022_144844_613050_DF8EB5F1 
X-CRM114-Status: GOOD (  14.80  )
X-Spam-Score: 1.2 (+)
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
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Jonathan,

Fair question - the change is a conversion, and I do not have a RiscPC
with an Acorn SCSI card to test on real hardware.  Here is what I did
test:

1. Userspace unit test with a mocked MMIO layer

   I built a small harness that compiles acornscsi-io.c unmodified
   against stub <linux/io.h> and <linux/types.h> headers.  The stubs
   map readl()/writel()/writeb() onto a byte-addressable "card" buffer
   and a plain userspace memory buffer.  For each transfer length L in
   {0, 2, 4, 8, 16, 32, 64, 100, 512, 1000}:

     - __acornscsi_in: I filled the "card" with L bytes of a known
       pattern (each 32-bit card word carrying one 16-bit halfword in
       the low half, garbage in the high half) and verified that the
       output buffer matched the pattern byte-for-byte.

     - __acornscsi_out: I filled a userspace buffer with a known
       pattern, called the function, and verified that each 32-bit card
       word held the expected halfword duplicated in both halves.

   All 20 cases pass.  This is the harness that caught the two issues
   the sashiko bot later reported independently - it is not just a
   smoke test.

2. Cross-compile for the target

   Built with arm-linux-gnueabi-gcc on rpc_defconfig with
   CONFIG_SCSI_ACORNSCSI_3=m.  The module links cleanly
   (acornscsi_mod.ko), and nm on acornscsi-io.o shows:

     00000000 T __acornscsi_in
     00000104 T __acornscsi_out

   objdump on the resulting object shows that the alignment step
   compiles to "bic sl, r0, #3", matching the original assembly's
   "bic r0, r0, #3".

3. Apply to a clean tree and rebuild

   Copied the tree, git reset --hard to the parent commit, applied the
   patch with "git am".  It applies cleanly; re-running the same
   compile command produces the same object.  This confirms the patch
   file itself is intact and does not depend on my working tree state.

4. checkpatch.pl --strict --no-tree on the patch itself

   Reports 0 errors, 0 warnings (with FILE_PATH_CHANGES ignored, as
   drivers/scsi/arm/ is already covered by MAINTAINERS).

What I did NOT test:

 - Real hardware.  I do not have an Acorn RiscPC or the SCSI expansion
   card.  The unit test proves equivalence with the original assembly
   semantics, but it cannot prove that the semantics match the actual
   hardware - only that the C version does the same thing the assembly
   did.

 - Odd transfer lengths through acornscsi.c.  All current callers pass
   even lengths, so the trailing-byte path is only exercised by the
   unit test, not by the driver end-to-end.

 - Interrupt handling under load.  This is unchanged by the patch (the
   IRQ path is untouched), so I did not add specific coverage.

If there is a specific test or configuration you would like me to run,
please let me know.

Breno

