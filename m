Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 827D7606A320
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Oct 2026 18:42:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=uY0dd2jE;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=aAhFZ643
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=M4PRNLWENu8KTspo6tzX21p33JWmvMwO8+MOa0PXQoA=; b=uY0dd2jED3z97V
	FEWPFLX0B1cPcELWFiMFC7MIJ5LoRycjRyB/Z3E279pCxbcpVZTisSbgwnJ7LMbgh3BSQ9B6dV4eE
	yg7EoA/v7TSVgr8D5uMpNCDCHhj+SaPxO2nfGCn/EjNvYdW+lIBY8ill3zyjZ8peFFpKhsv440X12
	LTlAK3MiHsM5wxnSV4E7GHWVeOTJxthBoJofWTBiskPMj3zmbU4KFTj4gQxS7RXcVeWgOUR9F31Jl
	E9dzqmjH14Q94iuQ/QzDtN4VIsVUzlhQdE8eftRFRLaC1vwjEm8OM0+6cCVvgKCN67y3EuxFixXSg
	3pvPAKO9c5c6kehZpMzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKKE9-0000000GnVH-1Ii6;
	Fri, 23 Oct 2026 18:42:53 +0000
Received: from mail-ot1-x334.google.com ([2607:f8b0:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKKE2-0000000GnRa-1hXR
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 Oct 2026 18:42:47 +0000
Received: by mail-ot1-x334.google.com with SMTP id 46e09a7af769-843a4ca671eso622037a34.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 23 Oct 2026 11:42:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792780965; x=1793385765; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=M4PRNLWENu8KTspo6tzX21p33JWmvMwO8+MOa0PXQoA=;
        b=aAhFZ643kjwDCBhyXAB0iocONuJSZbK9n0vDRftzuUF0BdKREgBGlKFODrbPbrFVg+
         YNvWNZBCzYQ5p1kWuqL2Zxmqg3eN2kd408k1ZbGfPjVRJtc3v1A60Pn0jHj2/AdXS6xX
         rbwNs1+yblLx2mclEpEJudEz4KIKXWvVSY1fVtl0M2i+EaYaOhVfIq8Xu8NP2tIe4/WD
         SBu+Jf0CCLx9Qxx49GxCSwQh1nQIDxj+seTWswW2XhVtA6wIyqSn0ux4e0WfLlh3vmlq
         X0RiMRhD08zy3KTbmdWQoseMuL6HuS7ndECSVGQzqJdPlkvAIwOAEj4Vocfh+zFiJ3sZ
         vK2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792780965; x=1793385765;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=M4PRNLWENu8KTspo6tzX21p33JWmvMwO8+MOa0PXQoA=;
        b=JroQt4VZ3amHhbs6rSshKBe+yk4yZuJdGgZe9dDb5dFzL8KCVdayHxsv6lg/KLPloy
         dDKYebDgQfR89L2Fip8ZDuQoT/mfBRuHDwxG/hNTuy6xHHRfK3soc1DW+gJSoDfZom5m
         FlXOfsLJmqHlvRIEJAhhrojcZIbCZS644xqEi/Sz4tStp1YZGyICg4tQfewzMzc4S76c
         6qEaIPv7oEk8CK/6gXHgrpskVssy8vr7aB6/VKo3PPuxI/lZwZaM/sV8ry4MDfccmg0v
         YvZLRYdTNgqUXBl3EW8bI7MLy+buO1ef2KTUGo2fkmsmQOCTu2XVwdHwes3gw/jQfl/M
         drOw==
X-Forwarded-Encrypted: i=1; AKwUvByA65h+JyT0lvpD4WH7dEd31SzPMX12FjaXRFNk/hY5OrDDNRXXkQlinUvJqvrzOmRE/p0plNSqLadUXamHxKZ0@lists.infradead.org
X-Gm-Message-State: AFq9FYImQhemSvOrF6zhw08ZVL25EdBXAOz5q2uXVymko2Xzkcm/IjS+
	vvB49fMNxp54frn7q4uXyf1YD0Bfd+7lQsPeiIGSyvY1A1XGJzKD+mI8
X-Gm-Gg: AYBFou24Ve2KKtOSAUYANtwVB7ZSTUNBOn01ltKCUqHG6khtM8YZ8DrdSg6L8E7c0fn
	sa9xP5XquAnOp4IC6wOj4bliUEaVTjhB2YBQrcdCLwDnvDx/aKmSjbYc5Q1S8Hi2d0d0RRzfuB+
	2j86Ukly6+gWZo0bVVzqr8LFS2/560kdzruAql+Xsgx4qaeM8RovGEc5j1cwa2vL/yH+r7rGWp/
	A1Cqu51zvmUjTIUUxpiXzleOuiNbf7DUM5T9j6ow1O/jOowkR/bl5l3miPBo4nJVqkZ3c71yiw6
	GX/G/aR/tYV3dtsugTuM2y9zgufclN1jvgCt6jnr1VbPKyL/g/mVgyjJ6dk6sAg95r/Pf+PpiFV
	b70pSH5e5cV/MPyoCyb8ov37u24RPfkVzlbkFQJ3ye34Zz/vuK/l8y99dy/IqD6j4ajh+kwcSZr
	KinPVnAJuJwa/aMad6dXlIzY150LszKbEhPnlCu8QstzSwejNT88oA6Rz40mLCgoQGKCNhHZaFI
	lEpjx5J4Mjgiv4l2F5zbqy2GoX8JTH7ndRPEOfUm9fl0xpO6EsHc125DetjWBnm9IT39Iq7PO81
	NPSeR04j1+ELenxsXJYixKAI/gD3/4EnDwyUTp2zJP9ldk0kjpX/AX+AUORQhgMiNX+ytE73hTB
	b2E/qZ8O+LsjDcvdwUUVV6ECkgD9tNHOqKYgV7+UFKNHU3xkZsZSKCAY9UeIIIZqSANJ3es8WaY
	KtaQ==
X-Received: by 2002:a05:6808:1819:b0:539:596f:6623 with SMTP id 5614622812f47-55c0035e613mr53516b6e.64.1792780965312;
        Fri, 23 Oct 2026 11:42:45 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-55bfe199544sm336682b6e.13.2026.10.23.11.42.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 11:42:44 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 23 Oct 2026 12:42:36 -0600
Subject: [PATCH v2 2/6] dmaengine: sun6i: handle the last partial interrupt
 bank
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261023-submit-sun6i-dma-lifetime-next-v1-v2-2-c9e07cc44bf8@gmail.com>
References: <20261023-submit-sun6i-dma-lifetime-next-v1-v2-0-c9e07cc44bf8@gmail.com>
In-Reply-To: <20261023-submit-sun6i-dma-lifetime-next-v1-v2-0-c9e07cc44bf8@gmail.com>
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
 Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Arnd Bergmann <arnd@arndb.de>, 
 Maxime Ripard <mripard@kernel.org>, Jens Kuske <jenskuske@gmail.com>, 
 Jean-Francois Moine <moinejf@free.fr>
Cc: Hongling Zeng <zenghongling@kylinos.cn>, 
 Chengfeng Ye <cyeaa@connect.ust.hk>, 
 Nguyen Minh Tien <tien.nguyenminh@embeddedlinux.blog>, 
 dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 James Hilliard <james.hilliard1@gmail.com>, 
 Sashiko <sashiko-bot@kernel.org>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261023_114246_450420_8758C34D 
X-CRM114-Status: GOOD (  14.17  )
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

The number of physical channels need not be a multiple of the number
covered by an interrupt-status register. H3 has twelve channels and
eight channels per bank. Rounding down the number of banks leaves its
channels 8 through 11 without completion handling.

Round up the number of banks to visit, and stop processing the last bank
at num_pchans so unused status bits cannot index past the physical-channel
array. Use the controller's configured bank size for both limits and
the physical-channel index.

Fixes: f008db8c00c1 ("dmaengine: sun6i: Add support for Allwinner H3 (sun8i) variant")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/r/20260706065650.34B131F00A3A@smtp.kernel.org
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/dma/sun6i-dma.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/dma/sun6i-dma.c b/drivers/dma/sun6i-dma.c
index 9d94a37fcf10..0a9645171180 100644
--- a/drivers/dma/sun6i-dma.c
+++ b/drivers/dma/sun6i-dma.c
@@ -587,12 +587,13 @@ static void sun6i_dma_tasklet(struct tasklet_struct *t)
 static irqreturn_t sun6i_dma_interrupt(int irq, void *dev_id)
 {
 	struct sun6i_dma_dev *sdev = dev_id;
+	u32 channels_per_reg = sdev->cfg->num_channels_per_reg;
 	struct sun6i_vchan *vchan;
 	struct sun6i_pchan *pchan;
 	int i, j, ret = IRQ_NONE;
 	u32 status;
 
-	for (i = 0; i < sdev->num_pchans / sdev->cfg->num_channels_per_reg; i++) {
+	for (i = 0; i < DIV_ROUND_UP(sdev->num_pchans, channels_per_reg); i++) {
 		status = sun6i_read_irq_stat(sdev, i);
 		if (!status)
 			continue;
@@ -602,8 +603,9 @@ static irqreturn_t sun6i_dma_interrupt(int irq, void *dev_id)
 
 		sun6i_write_irq_stat(sdev, i, status);
 
-		for (j = 0; (j < sdev->cfg->num_channels_per_reg) && status; j++) {
-			pchan = sdev->pchans + i * sdev->cfg->num_channels_per_reg + j;
+		for (j = 0; j < channels_per_reg &&
+		     i * channels_per_reg + j < sdev->num_pchans && status; j++) {
+			pchan = sdev->pchans + i * channels_per_reg + j;
 			vchan = pchan->vchan;
 			if (vchan && (status & vchan->irq_type)) {
 				if (vchan->cyclic) {

-- 
2.53.0


