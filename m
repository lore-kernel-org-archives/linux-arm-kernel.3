Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB137606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 Oct 2026 21:06:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=P0uIeKi1;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=sZUmfv7f
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=fxNhFdCnRx1TnZ/VZCHBg1thsLr/kiS3HyDFHely7YU=; b=P0uIeKi186LiXFG37w5WAheA6N
	UDxdUz+zZ7eohyplMkyo6Eiyp8WuvHQe0JLre814Ez3rBd0/Bj0w24R160yatfJYtWh9eiCVW26bq
	VJedE3cHXbubitPynN6/Fb3GBziAIRUe9vW7gsCxVYyF6457VtjoX1PYw4DHRwWitAu/N2kxFBBGd
	26np7vDuOo27SQRUrWOffPY7qjFXJUhHVXwDJxMhVgmsPlTDtaXvHtARusKxSi18WtIM46D1LUyaD
	65O/CPzZkp80qnEILiHjd+mUQL/rITvN1mrzuLLskXgMyVqOR3pIWprc56dM/zItYcdrZt1EIeVXX
	hKB77z1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJdWK-0000000CtgL-0fKv;
	Wed, 21 Oct 2026 21:06:48 +0000
Received: from mail-ot1-x334.google.com ([2607:f8b0:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJdWH-0000000Ctfu-2q4b
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 Oct 2026 21:06:46 +0000
Received: by mail-ot1-x334.google.com with SMTP id 46e09a7af769-844a8bf7e25so847122a34.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 21 Oct 2026 14:06:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792616804; x=1793221604; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=fxNhFdCnRx1TnZ/VZCHBg1thsLr/kiS3HyDFHely7YU=;
        b=sZUmfv7fbeE/Z8w6AJhkvgMUBtHuIBvZ6Dnh0S8bZksd/9ZMMOrX+6/Xt8EoMtEZQi
         cmcIPDwNYIXD4dvZeBgDa636PIDFs0cAD+pbYHao01CCNh+Xbw5d6imzu/Sr0tfPH6sC
         8PiyWYEUTcwKkIDn/ImFtN+DpG5BvaL07oqur5acIWwe3OrhS7N6b6ft1w9EGW95N2XW
         Wf/Se6Jj20jFkR0BVcnec+QYW5mR5Kuf9VJ0r6i/A6xGEsF56/5MAgGojmV+yGZSMXbe
         +R8RFqTwp/1p/5E84oTUDYm30vM78TeKldgKMeEz3xrimh44dr5sADe9sCOediMyRguE
         Iqkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792616804; x=1793221604;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=fxNhFdCnRx1TnZ/VZCHBg1thsLr/kiS3HyDFHely7YU=;
        b=bTUkoQpmYv+TKrVXNz7A+CHN0PBI/GJ7YP/QSxjoqXHOy3ekbVY1fXEr1r4G2zFXrE
         sr96q3Sg5E35WrrsfNLTTv7JJXFj673tKqP5wyA8bvpYV0bmn08gtyqWHmiLLCqKpW51
         Ol6VUodFPEtWwv9kENoMCGcdU0onj9fXcq9DxYsFEIUJse3nXROmVUiBcV/imclF1L+Z
         mO0hC0zne+t9FszXQf30PZtdatnVUiGO5/xGHaVF0ZAev6O53KucG0G90np7s7bGKOlD
         5O/rQY1oea336kZDUdJZb5bfTLZD+jUgQgUn9On7yKGjQCRsVaotg2kVsckz67xurN36
         1vBw==
X-Forwarded-Encrypted: i=1; AKwUvBxXARFHywItNHzYPwwKzzzii1iZHJHprVcBUCmf/X4GuSg5SrS8VhyZPwuPUVOfDvoXA7hQwCJICHPOaCZdD59B@lists.infradead.org
X-Gm-Message-State: AFq9FYIWDOBSA6Ld2erjavfC8hUTPT3ZsyFLL8QuFfAzR1exsUN17G4T
	XGBmI+hXNg8MJQuNshVEcwKbUVGgx0rChzaRGL0DaJ+agQQkI+B9oHlQX+yabg==
X-Gm-Gg: AYBFou22DIXdyKN/nGHZdab89g8uNPrMn5Ja3/ikcaB88NdUbsRo70CbRuVeF1mdYgQ
	JOntlEncnOAKE0wstGeaHpejexgq4EOpVR7FZN+WV5ZcETU5MQA+5Jb+N2sJ2gvrmVjysIv+rEw
	TZHsqSOFrXx5K8NOhJd+w1T8i1DQ97dbHcr9sDyIivuGIJHunWjTVwXUuiNhAk1sBgV3+1bNW8k
	QiZpYJiAxXXk/dfZ9eU9FsCRC1Jqod8Ld6Z5LNF9R8V4Ni2f+zsgkJW/dSgGmT858hlFstoUAgo
	MB3ifN6FalStKnQTHs/8gsrzhyYh1OO0eNEa47ZSNiFel6zZQI4bPOz7VhqF+WEhfPfpgUKksTB
	1/05XPlEvuwaptWGHhmZvjnxPGzhoOA3uFZpzbe8SKJUOK4G+UnynLTfpY19r7+0rBGTNUaMmJb
	cUXtnsMlOFyree09BXMavRnueuocL/q/RUvkZIlz9Rl/NF4DN6KodhdAkGSLGc8hckFQGHx4Tdf
	kVu5I+QRzLPqeNbI/SEFg5xvIFGC6CmmvIGPlwxvtpwkON2VOaeRS6rQLuGWXp2raVY2KH9fJVG
	Ltj3S+MwB7MmTd2ZHC2qT04DEMe9ihTeGtk9AW/3UEFQFkz9IYaycmrs3SOPRCg74ILNKVywI8C
	DJGrLORA5wmT7N/2h90zbdzUI3RU0HKNZkfcLLXtkMKyS5yov4MvXvFl63cMKRiJkDxIdKGy8w9
	bLrA==
X-Received: by 2002:a05:6830:3495:b0:81c:a8c5:633e with SMTP id 46e09a7af769-84d08afde73mr2463140a34.11.1792616804678;
        Wed, 21 Oct 2026 14:06:44 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-84cbd2d04b5sm3466826a34.14.2026.10.21.14.06.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 14:06:44 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 21 Oct 2026 15:06:33 -0600
Subject: [PATCH] dmaengine: sun6i: bound burst selection before shifting
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261021-submit-sun6i-dma-burst-limit-v1-v1-1-41a7a476ef66@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yWN0Q6CMAxFf4X02UY2CUR/xfCwjQo1Us02iAnh3
 +3k6ebctOdukCgyJbhVG0RaOfFbFMypgjA5GQl5UAZb29bU1mBa/MxZQ1rGYXbol5gyvri0q8G
 mo4u9dqbpDIFaPpEe/P0v3PuDVfGkkIu2XHiXCH10EqZSqZNkZKHz8bfvPyr+VHqlAAAA
X-Change-ID: 20261021-submit-sun6i-dma-burst-limit-v1-47e32971471e
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
 Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>
Cc: dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261021_140645_727313_EF83105F 
X-CRM114-Status: GOOD (  11.27  )
X-Spam-Score: -1.9 (-)
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
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

find_burst_size() tests BIT(maxburst) before reducing the client's maximum
to a supported burst length. DesignWare UARTs request a maximum burst of
one quarter of their FIFO size, so a 256-byte FIFO supplies 64. Shifting
an unsigned long by 64 is undefined even on a 64-bit CPU. The fallback
loop can repeat the same invalid shift.

Limit the search to the highest burst represented in the controller's
nonzero capability mask before either shift. Larger client limits still
select the largest supported burst, while smaller limits retain the
existing power-of-two selection and the zero/default case is unchanged.

Fixes: 7178c3586ab4 ("dmaengine: sun6i: Choose appropriate burst length under maxburst")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/dma/sun6i-dma.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/dma/sun6i-dma.c b/drivers/dma/sun6i-dma.c
index 7704b016aed8..a8b12262b3c3 100644
--- a/drivers/dma/sun6i-dma.c
+++ b/drivers/dma/sun6i-dma.c
@@ -590,6 +590,9 @@ static u32 find_burst_size(const u32 burst_lengths, u32 maxburst)
 	if (!maxburst)
 		return 1;
 
+	/* maxburst is a transfer limit, not necessarily a valid bit index. */
+	maxburst = min_t(u32, maxburst, fls(burst_lengths) - 1);
+
 	if (BIT(maxburst) & burst_lengths)
 		return maxburst;
 

---
base-commit: 93f51579e7df248780214094418f205253383cc5
change-id: 20261021-submit-sun6i-dma-burst-limit-v1-47e32971471e

Best regards,
--  
James Hilliard <james.hilliard1@gmail.com>


