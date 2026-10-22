Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B223606A320
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Oct 2026 18:53:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=d9c/ggaY;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Xs6nNVrc
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=AWyBv4fpq7McuxLCX2w8h8EJeKQuEsSj5BIooBiqeg0=; b=d9c/ggaYAfv/Gs
	dWdvyJ1bmqX7lIZJzl166Hxo7poOv+3SnxJ3dQzhLbI4v4Z/+MbPGrnR6WfHVaAB+XSJkuTQAIQGw
	s6aIBZE5L4bEKFGdbWLjf0JEIJNvTeq4QEirvQKAcYwBT7/en1Vai5SO9VmfjoBepp4z8fuTKckB/
	ub4i/r5dWSQWiWZcvzCRQLIlfRXCW5PV6s5wfN3ypby5h4tUrDYYIHIIch4+P+hYdhu3MTU+HQUpZ
	X/1yZZZyvPhqPE0s06uWPPYMgNzXrk4DUWesml7uBcOmN1QOp/f+6NCVkEvFPbF10NKQo2rA7FNdY
	wChXGKDMY2f2RxY5mz8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJxuK-0000000Ekem-1iHf;
	Thu, 22 Oct 2026 18:52:56 +0000
Received: from mail-vk1-xa2d.google.com ([2607:f8b0:4864:20::a2d])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJxuI-0000000Ekdm-0gLf
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Oct 2026 18:52:55 +0000
Received: by mail-vk1-xa2d.google.com with SMTP id 71dfb90a1353d-5eac6c5f927so88019e0c.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 22 Oct 2026 11:52:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792695173; x=1793299973; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AWyBv4fpq7McuxLCX2w8h8EJeKQuEsSj5BIooBiqeg0=;
        b=Xs6nNVrcPpWfWES7vidcjoo+0DDJ5EAJCf/GFGRoBCvDarXfL1SAzUFNZcvlD7UYgv
         /fosgfLzrvyksIA1rTuI7ULyu0oytnglmZbRrmnncTArdCPM6NVeKDwWSChhHZvLkldr
         6U74TnLYGf0eqqHi+jAc7uP8cY9CO5OYovIHje56y77tYsdhIkCSfIApvokCNb9GEwKY
         iRIiW6e7F/YLOsHKVuKhjEZ4+RVkYAlszuA+qkrtu8+TE17zO5yxJ01X17LPpP5d1Ewj
         UOfKNaOZrj53FST1QSx0gOBQ8b9NJbu3o2WSiZkpMPufzxCBrCUYxn06KeESb7x2czf5
         DNWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792695173; x=1793299973;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=AWyBv4fpq7McuxLCX2w8h8EJeKQuEsSj5BIooBiqeg0=;
        b=xo6s55dnBoLwb7XB+KWgv1rfU3G3MrZVGFYqjN8zwt3KoD1rIwEYzLi7qopH6o0Xn1
         9NyFfOyiGY1Li/TivAzQij4iFKMSXx8YPZpaitL8Gx41FWmptYHTzgTTEV6ZRVd07kNU
         uv1PTWmd3eyU5bwnHI4rxL73DiqdOQnZ0Y/EGm9H8lYISNbKvEDpUgeaNIM9+SB3Ilar
         FN3teD8EBtTRQzJ6H/qE3Htx23uqkupuCzRY8T9np4UOhjjjIzJ+eSXrnq6AutJD0UZb
         aO2lcyi2eSIjwDIl7SEmmqiFBpty/mKGIkM/22qBl/po6ztnXIOZU5kCH9PWs4wJIqPP
         BOJg==
X-Forwarded-Encrypted: i=1; AKwUvBz4oNsWPVRkZD8PB+auQBMGOibipPK6EAJOPLHvmnzfgD0/kBfJ8Z9vU5H5hMPXbop51j8kFMcceGtwtZOCCIHO@lists.infradead.org
X-Gm-Message-State: AFq9FYJPV2D4D2eLyXCFdauUspWRkGU3LEZqEp5gQS2Ks6x6n51aaRSA
	Nj+Z7v9fa/0oqdDyZSLYqnna00g4cpA1pxV84QuvaKvsVh5s0SFSO2OwD/RJZUgC
X-Gm-Gg: AYBFou0RFDEI31AHM9Ykksq2c+Cp7kHzFIAPQy/QO/hyGxBZKqBfVwRujHC/CC7SjCH
	GaS6wIX0ke881K3vGoeub1QLy20WB/1MSrmiQ7fVyjZhWUddAXIi7R6P4VuKn5bfBttWvIQRpXs
	t0ZYd2vg7mk6fBdTtqlgzIEyzLw+Li3cDEZWU6GjraGiwBBiYjojKHmi3YqdLcikZJbcecX4je6
	2QxJzW58js2rp75if6gDD4sshjBn17SMANR3aa+2bk2VQI0r9vVeaUNTw4ZB9xb6aDs09+cZdQ1
	cRp6QDg/Iyv9VqW9hiXyXE3lpddTW2uaGTWwxr7HgoqWvu22kNz9bnmnWi7YzxstbfLfmpY5QzA
	/UaewFU6lD4z6vU1C3xFBILNwKc0dA+fQamVFvqgA/8mBlJWtuGWZocHnTmC0CKRh0VqPKGVF7t
	3KlQl/D9FWcRJ8awqXUbitHGOUc1T3YF5vNbCFlQWrmqAEnq1C4Ur784WIo3brweoSFc1zUBXGl
	4nbkuv2IfGz7ncfH5DQDU4WLsL1828hz8ShkQWQn9NWZqY5VcBfGwWKZ3ye6O1Oz9q6bFAqQ3ck
	/FVZgWU8azNCCBhF8Tbn
X-Received: by 2002:a05:6102:2912:b0:7c3:7286:b7ea with SMTP id ada2fe7eead31-7ccc334dc12mr133557137.17.1792695172635;
        Thu, 22 Oct 2026 11:52:52 -0700 (PDT)
Received: from Biostar-A520MT ([187.94.15.233])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5ec124a7da8sm508980e0c.5.2026.10.22.11.52.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 11:52:52 -0700 (PDT)
From: Breno Rodrigues Alves <breno3011alves@gmail.com>
To: linux@armlinux.org.uk
Cc: James.Bottomley@HansenPartnership.com,
	mkp@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-scsi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Breno Rodrigues Alves <breno3011alves@gmail.com>
Subject: [PATCH v2 0/1] scsi: arm: Convert acornscsi-io.S to C
Date: Thu, 22 Oct 2026 15:52:23 -0300
Message-ID: <20261022185224.60700-1-breno3011alves@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261022183658.58090-1-breno3011alves@gmail.com>
References: <20261022183658.58090-1-breno3011alves@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261022_115254_204477_BBBAA36A 
X-CRM114-Status: UNSURE (   9.03  )
X-CRM114-Notice: Please train this message.
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
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

v2 addresses two issues raised by the sashiko bot:

  - PTR_ALIGN() rounds up, but the assembly's "bic r0, r0, #3"
    rounds down.  Use PTR_ALIGN_DOWN() to match, otherwise an odd
    on-card offset shifts the entire transfer by one 16-bit halfword
    and can walk past the 4 KiB card window.
  - In __acornscsi_out(), the trailing byte loop advanced by 2 bytes
    into the unused upper half of the current card word.  Advance by
    a full 32-bit word (card++) so the trailing byte lands in the
    low half of the next card word, which is where the hardware
    actually samples it.

No functional change for even-length transfers.  The odd-length
behaviour is now correct for both directions.

Breno (1):
  scsi: arm: Convert acornscsi-io.S to C

 drivers/scsi/arm/acornscsi-io.S | 116 ------------
 drivers/scsi/arm/acornscsi-io.c | 168 ++++++++++++++++++++++
 drivers/scsi/arm/acornscsi-io.h |  15 +++
 drivers/scsi/arm/acornscsi.c    |   3 +-
 4 files changed, 184 insertions(+), 137 deletions(-)

