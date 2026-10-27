Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 317FE606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Oct 2026 03:54:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=tVD0RFQa;
	dkim=pass (2048-bit key, unprotected) header.d=manyhobbies.com header.i=@manyhobbies.com header.a=rsa-sha256 header.s=sig1 header.b=aJh0AGum
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Cc:To:Subject:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=c557NJspcrYp97wcV3FzkxycYN4AmMz1y8uOKeLXX9c=; b=tVD0RFQamepfn27fmVhDDkrNIo
	PCtWy96GUSyRUg+chqY86ShLmUH4Ea2fD9kCoJ0cvkAMVqN8voFRX25qMB93F5GM0LeKjIrsz9y/T
	FvVHilbmWKlgl3UTYcnH0dTumPRH61URHRc0vcT+GX/cU4zh2R8IBt/pNxyTyCeoHk7MYkNn8T5Mg
	BT1iW+Q3KRjam6BUKiXyq+KG4NIXYLAUbvwAhzq9JHy6OoKbA+NNcj0+fL3NaiYQkXKxGlzpujmVK
	eTUogGao+Ij1gnfCPZ3dkqgxiJTcZFP335HoFr0Zu8uwWzZEHStmMPx3+zHR1BmQHo/jWVXyXZNiO
	IfQZFrww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLYGk-00000003iuy-3nlp;
	Tue, 27 Oct 2026 03:54:38 +0000
Received: from ms-2001h-snip6-7.eps.apple.com ([2a01:b747:3002:203::4e] helo=outbound.ms.icloud.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLYGi-00000003ito-1vro
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 Oct 2026 03:54:38 +0000
Received: from outbound.ms.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-west-3a-100-percent-5 (Postfix) with ESMTPS id 288F518000AA;
	Tue, 27 Oct 2026 03:54:28 +0000 (UTC)
X-ICL-RepId: 01a17b7e-c94a-7c5d-b7c2-55b64c5de973
X-ICL-Out-Info: HUtFAUMEWwJACUgBTUQeDx5WFlZNRAJCTQhPAUMGWQZeD04dXwVcEhVdRUcMWkVWH3kVUgNOA10SWxFWHhkIXR0ZHldQWgpcCVEXUQ9eDkFeWhdeTUUID0kZEFYBWFZdBU0aXBhZDxwdSlZaDlsERxQXG1wAFxtGAgQjAl8ARQJeCVYBMBcPVk1UGV0UXwRQElAdQENUBF9QVBFXUAtaBUkKSAReBlkDQA1WAFQPXQFeCEoAWgVTA0QITgBZAFkKRAFPBl93BlMeQBBcD1UCVwMXG1wACUtGCUkdDg5CGEYfVCdXAloKWx4=
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=manyhobbies.com; s=sig1; t=1793073271; x=1824609271; bh=c557NJspcrYp97wcV3FzkxycYN4AmMz1y8uOKeLXX9c=; h=From:Subject:To:Date:Message-ID:MIME-Version:Content-Type:x-icloud-hme; b=aJh0AGumjEqUA82HLgydg7bSQii8pFGQGAywdpmcFB++chslRvqswtVMzE5ZazNKcUGMRGzKtPZJS8794b+0TYfvdYOfTWqkLt29D/uZomQOMi4t+PHKAfClCJ9pVlsOBlyRfzDFpXSGGVsJUvEtDQLyc28ZuQyAXdyP43ZXY1Inz/30xp8guqug6SQAg5ds8ARhTWj5L6oXT3TxqotmXq1crgTXnhtJw0CblRC92iU+shQ9Husp2ECB8TGQ3B/L+RsftGhY18oE6we4wdWnkoSFD654T7/J13iA48f1FNOiln3O495aMSRMMByoxB3YAHAkbO9dYgQ5T2X9VMhVvg==
mail-alias-created-date: 1780273699991
Received: from claude-agent.manyhobbies.internal (unknown [17.156.208.39])
	by p00-icloudmta-asmtp-us-west-3a-100-percent-5 (Postfix) with ESMTPSA id 26068180009A;
	Tue, 27 Oct 2026 03:54:28 +0000 (UTC)
From: Tam Do <tam.do@manyhobbies.com>
Subject: [PATCH] mmc: sunxi: reset the controller after an update-clock
 timeout
To: Ulf Hansson <ulfh@kernel.org>
Cc: Chen-Yu Tsai <wens@kernel.org>,
    Jernej Skrabec <jernej.skrabec@gmail.com>,
    Samuel Holland <samuel@sholland.org>,
    linux-mmc@vger.kernel.org,
    linux-sunxi@lists.linux.dev,
    linux-arm-kernel@lists.infradead.org,
    linux-kernel@vger.kernel.org
Date: Tue, 27 Oct 2026 03:52:01 +0000
Message-ID: <179307312104.39863.12372814163472848752@manyhobbies.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Info-Out: v=2.4 cv=fbugCkQF c=1 sm=1 tr=0 ts=6ae02076
 cx=c_apl:c_pps:t_out a=kRaGL2Q7qLiahLf3O6OaIA==:117
 a=kRaGL2Q7qLiahLf3O6OaIA==:17 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=w2OPf45SAAAA:8
 a=OBswR2QUZwThbbyFsH0A:9 a=QEXdDO2ut3YA:10 a=-iXIJKm6ftRzmWoHelNS:22
X-Proofpoint-GUID: y2SgpGtdZ7vHdcPuD7Ypjoc6D-Sv23Sj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDAxNSBTYWx0ZWRfX6NLdvTed6MJk
 NDt9+8d0rQtPMNEI7W0Sgwrwc5t34pOkSvmarHPDHtAhv3/NplmE+OYdB0qFxLm6lN3CuyCeQB/
 BEr+gIT7FTo5/RmL7XAdxxnQA5wf2cIgL17KxQ/991O1rDI8PodIbltZ/jotFG2/umWdKCAgO5X
 LGK5r8G5VJsf9HisuUcikkDlVONrJ2fe0ACUD6RrADoZPRXs7yZsHZAn66kAhRau7pa9gtiYtYZ
 LtJc0kxK03QFHId6WWBlNijwmYfJOykTq/+dJScH+rDAGKucc5UqKruTuKTp4ZQDrPhIF8NGchF
 TrRkbvLAcYEBoB4Id2EHjfrmSw1/RwbQ5tX7gKcuXHvLss9AMGP+atvsvXYdp4=
X-Proofpoint-ORIG-GUID: y2SgpGtdZ7vHdcPuD7Ypjoc6D-Sv23Sj
X-JNJ: AAAAAAAB97Wku43oW0onLL0nsnuVzNu/wNnoSw2Lfvo1qg77wELWKGEOx6s/vTlMnrJy1v1rTIZ++H0LHfbQEvshtbpLg80viBL3MgEw9ypfH3ljJIbppdVgA/Fog/xP0A9MocRTnVlDRBQpwYD/+0IFgai8LiK4o/RNfYpBsgUwJdgK//KsqYoOvJhQ758Sn4ksBXAalCi2OYMuetJRVetvR9qaaNCGAPT8OHhXZ9DxvNMwOpuBZyuJxppSwoI6C28PPZm4R1PPSbb0wvf5/Mp6IlA2ggC4XPsRzc3qe9bFYj3+ZduQetG7/pP1FSwbyeDKp0tGjJkOnA2Lo+cU8o0hNh1MjWDB2v22l6JgbYQVd1ypsg+qlsLL9v/ZvEwxCTyCP7RcmGud8QgI8u6JkX5iAkc2UlR+nKfi+3UdI6mrdaQOTXvNpkC1lepH2Ikdgxbbh3zO1aymZQXK/n8lzJR44sgEQyGpRdPb8j2J84brmSedvC7P24qrKrPiwRZoalpw6EVqx+hbMxSwsRwmNWlCk3mQwU0BFotv+IvvRjmfmbiPzP5crWfXHAp5Dl9BzHY7YQD06WKHSvUXwm+JDXBq6RnY1gkbNiN5HJ/0aKRA0hX82FvRBhbrJsC3jeEdY2thvPN5MlAA+Cp6kUNXgYyrw3mk1RRnNFifNcxZhLFsMbDlmpVfLR7rN7X0tNPmjYbPKGo0h7IhZuDZb3GY61ESb6+O106ySIuZooKp7L1swTQ7UmHFfskNhQFJb81vNqODACe6ocjp+tjz/R3HPwe0mEhAkKu0LiMzZfe/o/7iAHBDYkWMbugTtcz+Te8t6uJvwOc3LAAXMoxNU2rI19bm2P1qtzEhz+X4jRH3fiMtRfUgNRb96sdUDr1zHTpAKZ+M9Ma5g2gbg4RYuml6e6wfRgxq3YLZwQcX5YGeliDixu+6pTVrNfK0885TG/xxwPJQdVy1eP77R4IXBMbLj0vqajXYYu7
 +vinsDdtAIdgHFCyqTOCA70Qy3VTY1lvl57b0LU0lwwT8zLVXRPwpNZeLEzN+mXf8rrQdHMgFdhD3fxUgFNw5Fu5Qr/IwvdmjyJvsJctIJTSbQGAfafBM9rs8R94yn2rgR4ORR2C1w+FRoZv32tscoaXhycEvYsst1HAtJqrVERdFmUeSfXN6Xvlm8D/X+ynHchM9lGTywhlFSCMaszZR/2ciaL1Op/3w0PaDEjyDOh6lbw97TR4fxDUdqAA70/qZsENOLcL9R+LCbk+jKRyg75NiN85pTaId9K+eq1yXd3Xeuh1dv5aO3RLNBzZNg0D0QJWbaZAeKWmC2RwU/7MFZ+ScKEbqzjz//yFSMpIBO+tcNZYt
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261026_205436_540114_31452A63 
X-CRM114-Status: UNSURE (   9.27  )
X-CRM114-Notice: Please train this message.
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
X-Spam-Status: No, score=-16.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

If the clock-update command times out it stays pending in the
controller, and every later clock update times out as well, so the
card cannot be initialised until the next probe.

This happens on an R16 board whose SDIO Wi-Fi holds DAT0 busy while
its supply comes up during the first clock update.

Reset the controller on timeout so the next attempt can succeed.

Fixes: 3cbcb16095f9 ("mmc: sunxi: Add driver for SD/MMC hosts found on Allwinner sunxi SoCs")
Cc: stable@vger.kernel.org
Signed-off-by: Tam Do <tam.do@manyhobbies.com>
---
 drivers/mmc/host/sunxi-mmc.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mmc/host/sunxi-mmc.c b/drivers/mmc/host/sunxi-mmc.c
index fe4c0f6..439cfa4 100644
--- a/drivers/mmc/host/sunxi-mmc.c
+++ b/drivers/mmc/host/sunxi-mmc.c
@@ -688,6 +688,7 @@ static int sunxi_mmc_oclk_onoff(struct sunxi_mmc_host *host, u32 oclk_en)
 
 	if (rval & SDXC_START) {
 		dev_err(mmc_dev(host->mmc), "fatal err update clk timeout\n");
+		sunxi_mmc_init_host(host);
 		return -EIO;
 	}
 
-- 
2.39.5


