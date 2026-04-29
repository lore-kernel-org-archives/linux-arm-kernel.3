Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6105AFF8864
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Apr 2026 09:16:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=SATdzDMyTuOhzxtlpYGXWtCzK5ku+exSSCqgROaZE+w=; b=1Tw/XFky0ALn+YiU9YyKX1R+DY
	fcZ7W15T0rkSZwAJSAMlp+NpQIg8m0sJaC/ngjacndqUho03h0Z3pu9b4DN+D9UuGAY2uNl3iAbRq
	CI0AbSAblncf6/sISB/3rIG3Ej3LO7bCK1g6+j6os/e5Z6tw0vwbnyJzDFrZD0ELEca/HR9/2g7JY
	zGSBZwzZZ3CcNkaVhuIladQTPzMj/8MybJC2JBxAMTRECps7ToG2CaHKwrj1fYcOb6RvG83TxGQZ9
	zw8uK2DoxpPZLPcPI5okF1vr5lAEvnrp/wAxApJ1W+nxq8MK9VSlOB7Jq3iJ80qAMl3rpysgbLaLO
	OJ9qklaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wI126-00000003JaI-2bqz;
	Wed, 29 Apr 2026 09:16:38 +0000
Received: from mail-pf1-f178.google.com ([209.85.210.178])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wI123-00000003JZx-1lRW
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Apr 2026 09:16:36 +0000
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-82ce2e2880cso8630771b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Apr 2026 02:16:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777454194; x=1778058994; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SATdzDMyTuOhzxtlpYGXWtCzK5ku+exSSCqgROaZE+w=;
        b=iKPahZkFEmoDF169dC3B0/qkL0ki1gzRSFkTefNQEWuvhhnJjI+M7rPo+kDqqQhVgc
         3OGBJEazUTedfWtg/HeT2SFKRpB+44nILW11p0BtHjcexH1XTvzjFeKHT0I6QogqE7Qt
         6+wjwJi033QR/RiERcXtLUF9xJ8NqKpj1jSTP6Qkpy2eLfC/iPJ0vs/VndjjO9LHQX8F
         ukpuviIg480xtawYGKfABINQIQKd9Ot+/5IpTqdQy6tZaRO2ONz2mCvxXJfiY9T8KWLG
         TmBVdu6aQAoBSqpkepvD2XXUzdk3BYU46MmCQWw99cG+hHzqhI4MSoaBt1ML/PJOnuqk
         nhmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777454194; x=1778058994;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SATdzDMyTuOhzxtlpYGXWtCzK5ku+exSSCqgROaZE+w=;
        b=s+WboRpWUVTibt2Es/q6FLPR1YqCqscMeQZfx+CYfh7Iphf+u939dBp3GC5hahj5ig
         dTIx+xShN/kmxAcV93yN/3VS0oPwEd35KBxDgXDgCMMvBP2NxR3l5rILWostXPCIOsmR
         M77/OoTnJCdg+rpKLZy2nRsAs5Bp0J7Ku4VIvXISCb44xFneSJ7tznzexjvC049WmSBa
         0vFEYsBhztZXN3ExiGHKJVfmyHmsiVB4VYJtw5gOVQDq6RawbxgAvJPOcLQlCf7RO5Ih
         4TpjizTf/3THcwbkz+uSdc/1mkQz9vzH9KA19ymyQjGhx4IT/iAhZ61qwTTpRePBK289
         fCPQ==
X-Forwarded-Encrypted: i=1; AFNElJ8OcCyM3+aGNlXntJds5qIebcQ9oBOOvt0ye0GbUZ+LCh40CpL+fw87YyhJzRB7UId7iugIFP1tGTR8m2rlWLKq@lists.infradead.org
X-Gm-Message-State: AOJu0Yy0h6jABf8jA/2R2R3VHIbm/FQSWlDkInPAlKsAqLJjkMtVnEty
	d3Okf/qXEsBdx65m2iam5+lZsbrWJKE/n3NuKHcHwgnTXhA1sLMnRSQZ
X-Gm-Gg: AeBDies9fo1Y4gwPXOwfWuzJcHRMOuwxg3qduX3DWc0g3345G/25hDZ6s2MxMyECGgU
	zvYNF/iTusIciEBpj3x0bwsgyvq12nDheKf1lomaqsg1KuX1KHikVbe3Q7wWB5d7d61jlIZ24So
	/1eDwma2Bt19hHSdAI+Ak0DcuIXiHPjJvgCDQ5xZn5lslkZGhb5C2+myVwimv+dtfpnleGp0Sfn
	j04m+d/RBwh8SKbC9PbxwtDTRP75Qal7qtaGag3rMjCeUadkxlvbjJiAcnAAzMUYLV0z+lzH/XN
	AJt4BXPE6ACMkJ5bTkjSoecdNg1cVTfC2vOJduvpn6/ztK40sWwuVsdghZHpstdoQaZINHLOhPE
	RgM0+MliL68ls/9WODlAF7tPO2uTdMDHCd4PHCqlCUx6gUfqnp7zXnWOfNYwXK+VGHj58WR7SPC
	Gf+ZuicefqRBxicNNiHLph4jb5TUkqZJI+HsIDfY0dYKLhedSlrBVNkDDq/4F1O4xQ9mD2
X-Received: by 2002:a05:6a00:4487:b0:82f:77c9:a89f with SMTP id d2e1a72fcca58-834ddc57adfmr7234747b3a.37.1777454194159;
        Wed, 29 Apr 2026 02:16:34 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-834ed5cd3b8sm1586865b3a.16.2026.04.29.02.16.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 02:16:33 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Joris Verhaegen <verhaegen@google.com>,
	Miller Liang <millerliang@google.com>,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 0/2] ASoC: uniphier: Use guard() for spin locks
Date: Wed, 29 Apr 2026 16:16:12 +0700
Message-ID: <20260429091614.96667-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260429_021635_481714_B03B6A71 
X-CRM114-Status: UNSURE (   7.78  )
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

From: bui duc phuc <phucduc.bui@gmail.com>

Hi all,

This series converts spin lock handling in UniPhier AIO drivers
to use guard() helpers.
The changes are purely code cleanups with no functional impact.

Best regards,
Phuc

bui duc phuc (2):
  ASoC: uniphier: aio-compress: Use guard() for spin locks
  ASoC: uniphier: aio-dma: Use guard() for spin locks

 sound/soc/uniphier/aio-compress.c | 24 +++++---------
 sound/soc/uniphier/aio-dma.c      | 52 ++++++++++++++-----------------
 2 files changed, 30 insertions(+), 46 deletions(-)

-- 
2.43.0


