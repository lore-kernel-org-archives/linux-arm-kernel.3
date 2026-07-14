Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00A24C43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jul 2026 13:31:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Date:Subject:Cc:To:From:Message-ID:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZJz5OoG83+btFSxggAH+9IZdnaFOVGIz/YLR4GE9uSY=; b=qHo+pb5/qBlq+ZPK+41FVIM+bn
	04dOkDLilc0AI+Kn6fuLbsR+QyyOnpsY/UFCK65x2bQHCbTR3cTuZgvMC7JeFuUH+jJyNmE8QfqRs
	2PPuz+u9nYYB4eTypDoWzIw5gTxQu7gVcil1PpEoq/qzt5tPb/lgviNUeG4dgLJkDCyIDl3hA1ffl
	/2UwSRMQUoLDMfeVbka64m/IvvqqXpe4+8P4K0x7Np81l1evbXrSkEcfdGpeMDdynJdYnZmigDoCi
	hCGLM4xtldkcAIQPObDJk+mgDiH8hDWSpijTe0n9Jzu66Ad6MC2ox0PMJKZ+vhYAvIh0nKZG2UztW
	BoV/NQ6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjdES-0000000CBOG-13SC;
	Tue, 14 Jul 2026 13:31:32 +0000
Received: from out203-205-221-221.mail.qq.com ([203.205.221.221])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjdEN-0000000CBMx-1sCu
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jul 2026 13:31:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1784035883; bh=ZJz5OoG83+btFSxggAH+9IZdnaFOVGIz/YLR4GE9uSY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Hri6nKMQIKZXzV0vE7wzkwahSjgm3RGVVSHBalFCGkoMmYzHlFBSgtcZCECLTtIHp
	 ZtybHPmyuzk2WE1iBr5bf7N9RS4hZlNxxW9D3zOgG6bG7W0NTxXjSniMjYeYZryeWc
	 sJ6V5HoYp+NnaHwHsX52+AQLXITYgOUXkFP1qCS0=
Received: from localhost.localdomain ([116.128.244.169])
	by newxmesmtplogicsvrszc43-0.qq.com (NewEsmtp) with SMTP
	id 7D5A9C39; Tue, 14 Jul 2026 21:31:21 +0800
X-QQ-mid: xmsmtpt1784035881t2yeerbw6
Message-ID: <tencent_92BBEC9E50E005DB0B52D2C055EF9EEC5506@qq.com>
X-QQ-XMAILINFO: MRb64KOzELYunlWsEiqV2DePYMEDDGwn8Cfume/60+wU2L9kl049x4mWYOx/8u
	 ppUlJzGBgiGW82irgrB94O+O4L/urhXdD/bLIufzImrnT6cS4AbN4c5Rzw2wAF8MUb2xl7Rd1yoe
	 weJ2MYjzqOjtzKqLKWxiTt9HU8kkxDqS0+yk+3Oo24Xsif7d7ZnGf7b5aLn5FXFIdwTAMzSOwYZo
	 HwmrhDYWoYfo0b9s3BpnBozlpxv7PitQYych/H25ayaX9VcbfSsz5fU2OHbStXXmM7+uKLDbYiiH
	 7RE0mPd0xjEvSZ28gQGWUHLGSyMIWUhAtiYZ8OXvS/Yc88sHKrqFHmKPtVaqZssxvTOhFLOrECfB
	 MC3EWfEJxKpB9K4Qg6nNSjhB1bbrvNdI9Rh325rM3FcQWmu0s3gEUrXi398CvgkRH2SigT2bP9Gl
	 qEK8p8/bXbeecCle8v0TtStuGDUKqt/maOlo4l3k3AsdyI4Rq5y4DWAHAtSpcS1nd3VkMY1AtC8D
	 InVgCK1HxNyNnLFMhQQvyWFuvv9EvS3ZP6NJvSFMrk0tU59MiPPhlKGjq2F56k/M8aFFAEixuPYH
	 q4kzlNuOd6Zuvtlm0dEtI9VNn9HtACUYa6uRIh6D/An7mZSVEyltJ08rSQcjKcMp1QO9hIfTQhNL
	 OSh02tx0GUvU2iq8to8OtdWyIYcIhm3z7L+tyzfMdgJH6T0Yozp3z4q7koFn2gS1kCcMuBwMqeAY
	 l0B8A1p/GZG/JPNs59qxRTcM6gnkitzPh4kdKaGQ/DoHm8vrKdQBs7vs+PvTK4g9bOjhfba4aqn/
	 oKjNmfliYjKYJsmSZ55wLxBRZ3vFoNs7gjpCyrcITZFhJ/xh9bvQcqIH3IzGIHYSSKwRpQu1EXzw
	 om43gyDPflxYD8pGRWoZP5YIWKw1gCrCnsyyOwRLIw3wgxDuE79TeLhOCeLPJqzEnyzkH7KLJLUC
	 oDGE+NUBR3ssJff+HG2uUT9J7WbQ77nbHOpqSQGzimciD+YWMI4Kwfb71BzSgp4PNR43SGPaVXQR
	 3kGQoDZygy8ME9cFU84lpDoSVlzVwUpcN3dCQA4cggbUsxVGYG3iJwhjc6/5YveF2zCwTKSw==
X-QQ-XMRINFO: NyFYKkN4Ny6FuXrnB5Ye7Aabb3ujjtK+gg==
From: Haofeng Li <920484857@qq.com>
To: tglx@kernel.org
Cc: linux-kernel@vger.kernel.org,
	Haofeng Li <13266079573@163.com>,
	Haofeng Li <lihaofeng@kylinos.cn>,
	Marc Zyngier <maz@kernel.org>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Vikram Sethi <vsethi@nvidia.com>,
	Shanker Donthineni <sdonthineni@nvidia.com>,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 15/16] irqchip/gic-v3: fail T241 quirk if alias ioremap fails
Date: Tue, 14 Jul 2026 21:24:51 +0800
X-OQ-MSGID: <20260714132453.3302672-13-920484857@qq.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260714132453.3302672-1-920484857@qq.com>
References: <20260714122351.3274006-1-lihaofeng@kylinos.cn>
 <20260714132453.3302672-1-920484857@qq.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_063127_797891_71A49597 
X-CRM114-Status: GOOD (  10.00  )
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

From: Haofeng Li <lihaofeng@kylinos.cn>

NVIDIA T241 GICD alias setup only warns about a failed ioremap, then
enables gic_nvidia_t241_erratum. Later accesses through the missing
alias can dereference NULL.

If any alias cannot be mapped, report which chip failed, unmap all
aliases created so far, and return without enabling the erratum static
key.

Fixes: 35727af2b15d ("irqchip/gicv3: Workaround for NVIDIA erratum T241-FABRIC-4")

Signed-off-by: Haofeng Li <lihaofeng@kylinos.cn>
---
 drivers/irqchip/irq-gic-v3.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/irqchip/irq-gic-v3.c b/drivers/irqchip/irq-gic-v3.c
index 99444a1b2ffa..a8a395a98c09 100644
--- a/drivers/irqchip/irq-gic-v3.c
+++ b/drivers/irqchip/irq-gic-v3.c
@@ -1840,7 +1840,16 @@ static bool gic_enable_quirk_nvidia_t241(void *data)
 			phys = gic_data.dist_phys_base + T241_CHIP_GICDA_OFFSET;
 			phys |= FIELD_PREP(T241_CHIPN_MASK, i);
 			t241_dist_base_alias[i] = ioremap(phys, SZ_64K);
-			WARN_ON_ONCE(!t241_dist_base_alias[i]);
+			if (!t241_dist_base_alias[i]) {
+				pr_err("Failed to map NVIDIA T241 GICD alias for chip %u\n", i);
+				while (i--) {
+					if (t241_dist_base_alias[i]) {
+						iounmap(t241_dist_base_alias[i]);
+						t241_dist_base_alias[i] = NULL;
+					}
+				}
+				return false;
+			}
 		}
 	}
 	static_branch_enable(&gic_nvidia_t241_erratum);
-- 
2.25.1


