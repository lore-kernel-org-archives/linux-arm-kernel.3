Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C105E77188
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jan 2025 09:37:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=UqzxWOab6evyJePUEZiyqiNeRR2ktAmye9JuSg0gIEo=; b=JMi1Kpw50IKS1Fp5E201eeWZfO
	Ar3J4x3jTS/9oq/wD6RwJQOkI0cmpjcHHHh0PM7fd93AaG6AVm5YKJPbx03vVjv4Uzzmxtm3KH1pX
	vuN87cnE5NcZK0GA1kFPeIJqQrav0ZAggj0n+QA+aGYLVSjbJpBUIDKD8cDaJL9J+gwX9Z7chbx3I
	M82sbSmkJS4N3bO2VXFPp5zG0klL8JKg0L9UqaoSPQFX6kqNfXt9o1svS0A8tOVcNe077pzd633bq
	J7VWrkJgwZB+So2BhDfAN6YxRKGu32rinpWqv8taWax3sP/zfH0wvDxxE/hpldsKdT515ZG0Fo3aU
	jN12RJbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVSV4-00000007olb-1tMh;
	Wed, 08 Jan 2025 09:37:18 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVSTq-00000007oEB-1tez
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jan 2025 09:36:04 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-4368a293339so133357095e9.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 08 Jan 2025 01:36:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736328961; x=1736933761; darn=lists.infradead.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UqzxWOab6evyJePUEZiyqiNeRR2ktAmye9JuSg0gIEo=;
        b=oaMzL/yTPkGL+DV9KtYDAK+U3iCg7MkNth5fnFovQTgY6DWPRqtIZWsV0kVkkol2+Y
         fzFsgq6JmzPfBjoAplunrYNpdCSs7ssPIAGrNSK9vF3gZzQnE20x1AuSlnIxPMeNArWY
         plUxhOfHGD/NJORjJ6B1tXfEZVOcucncDRwWCl1Eg4A1Khf1wR8L7BmEg+a0QUhHuHyF
         oDmTn04bcUTbatDZhucjASndKcC27Ba0unLC2PgX9pFhyy6q1lGcpkIqVd6jKbaVNt4I
         4oXtD5CrlWCSZgd5e9d9V25nOk8GIREP15j517Hc8HZkmB15pnlue5YUMR5umbTWtPyL
         ON5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736328961; x=1736933761;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UqzxWOab6evyJePUEZiyqiNeRR2ktAmye9JuSg0gIEo=;
        b=iXS2Z9i+atjRAE89zYyVEn4ddkKguPcs40FNC7oQYql50+hpf0ugZizddqQOXkNBTH
         WK/ZlcLf2uoImwUhvjw/+uwceeQKNAMg0Mov6ezMzzv8gUJumk1rg0vvXgF7FggLUJT4
         JF3xfwr0SVZARDOHmJoMqqAApMJt+2KUCyVONfv3x9XdCvahjX4tZoTAtlogI7ikL5fJ
         X9Qusk/UOydwWfiimrVOCFjpL4O+QzYVDo9eqPJ27hrSoF9P+bgay61YAA3RzYo1vpa1
         YOXOvw6AGmlR4fJpBY8pC08gV7nY/6ZvulalUe2mtlCr9vJz2jgP7/NHXjpmoe9jk2F4
         tYRQ==
X-Forwarded-Encrypted: i=1; AJvYcCXb+DoVrU1RW4MezTDIBJGruZ0MW3G81jcmdxGHeZk+/AhBvCgj2lAncLv9eCKo+bNC46a1vnM1yhbEPLwAkm1B@lists.infradead.org
X-Gm-Message-State: AOJu0YyMF5VUEviNKj5TpNixoBiA56xUNbxLfEGN7NgZ7X9tVT+j0jW8
	57IvDumAg9DCIop+BHe/K5z/8cSiEbFlltw8tr1B2R1C9vpHYOoU1wfI8cGqGag=
X-Gm-Gg: ASbGncuKmyhljRbpcjq5VP8ZnjhEMpkaC3y2ZzGUMXaAmJphimicYUSAAySE3kl0GpQ
	fqJ+CyR5wg5uwWCLMaVLFExUTdB9Fp7s+3sgnhb2nEVlHkw6d1haMyMFr6LFnnN3X35ZySWhpd+
	2imAOWc0N0sQAWj0Zot3yH/qqp7e/dkX7nO9MED995Sq2v6BixCxCp5w/iUu1hGVhMdH3eGSCbo
	608xzVZnybxUoB8Fay7pM5paNv+XT9BVGiR4RHu7dzVFj8AcwZ5T/iCkaQngA==
X-Google-Smtp-Source: AGHT+IG5WSBhFOJisgYTUKeIhRXBAfvDEN8YKwZDJA2mb5m6FO3aJNoBZk/2i3G8RcBgch7B0HaYEw==
X-Received: by 2002:a05:6000:1acf:b0:386:4034:f9a6 with SMTP id ffacd0b85a97d-38a8735727fmr1340774f8f.57.1736328960701;
        Wed, 08 Jan 2025 01:36:00 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-436e2ddccf4sm14566785e9.19.2025.01.08.01.35.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jan 2025 01:36:00 -0800 (PST)
Date: Wed, 8 Jan 2025 12:35:57 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Julien STEPHAN <jstephan@baylibre.com>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Mattijs Korpershoek <mkorpershoek@baylibre.com>,
	dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH RESEND] drm/mediatek: dsi: fix error codes in
 mtk_dsi_host_transfer()
Message-ID: <b754a408-4f39-4e37-b52d-7706c132e27f@stanley.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250108_013602_491505_47CB3B31 
X-CRM114-Status: GOOD (  15.78  )
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

There is a type bug because the return statement:

        return ret < 0 ? ret : recv_cnt;

The issue is that ret is an int, recv_cnt is a u32 and the function
returns ssize_t, which is a signed long.  The way that the type promotion
works is that the negative error codes are first cast to u32 and then
to signed long.  The error codes end up being positive instead of
negative and the callers treat them as success.

Fixes: 81cc7e51c4f1 ("drm/mediatek: Allow commands to be sent during video mode")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/r/202412210801.iADw0oIH-lkp@intel.com/
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
Reviewed-by: Mattijs Korpershoek <mkorpershoek@baylibre.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
I sent this patch earlier:
https://lore.kernel.org/all/Y%2FyBC4yxTs+Po0TG@kili/
but it wasn't applied.  I've changed the commit message a bit and added
new tags.

 drivers/gpu/drm/mediatek/mtk_dsi.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediatek/mtk_dsi.c
index d871b1dba083..0acfda47f002 100644
--- a/drivers/gpu/drm/mediatek/mtk_dsi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
@@ -1015,12 +1015,12 @@ static ssize_t mtk_dsi_host_transfer(struct mipi_dsi_host *host,
 				     const struct mipi_dsi_msg *msg)
 {
 	struct mtk_dsi *dsi = host_to_dsi(host);
-	u32 recv_cnt, i;
+	ssize_t recv_cnt;
 	u8 read_data[16];
 	void *src_addr;
 	u8 irq_flag = CMD_DONE_INT_FLAG;
 	u32 dsi_mode;
-	int ret;
+	int ret, i;
 
 	dsi_mode = readl(dsi->regs + DSI_MODE_CTRL);
 	if (dsi_mode & MODE) {
@@ -1069,7 +1069,7 @@ static ssize_t mtk_dsi_host_transfer(struct mipi_dsi_host *host,
 	if (recv_cnt)
 		memcpy(msg->rx_buf, src_addr, recv_cnt);
 
-	DRM_INFO("dsi get %d byte data from the panel address(0x%x)\n",
+	DRM_INFO("dsi get %zd byte data from the panel address(0x%x)\n",
 		 recv_cnt, *((u8 *)(msg->tx_buf)));
 
 restore_dsi_mode:
-- 
2.45.2


