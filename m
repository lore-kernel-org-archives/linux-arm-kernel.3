Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A957C624DB
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  5 Sep 2026 13:33:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Vv5oyIV+iTroIryK8q4maG4WM3D8XmfLPN5y+EKtsQ8=; b=SA4ztFHjRLBFVl9ZX0AyLnGe1z
	LDTEQQzh7o2qLlteHh/4BY/sW4iCO8mNatI4O0HA7KcoKQ0FBdesaMIuWvW59QC3M1QKJ8sYRFFpm
	d6YJVJ06M1JHbu78JBe/8sy6Lra/MRcbNyfSOuRsJtU3eVsIEY+BGtDzk/0pDqJm3Sh+KXq0HFUBF
	KK7ZHhocKQadCEpnk/tOo8ixVOD4Xg+FlGCZzX2sGKnBM2sZjvaEzsZz4JEP8gp7ASWd9difae4Fr
	vNkA3yybkANTVw1JCXikJv7jVAt5JSNSdMey0c64P30vXD88j0AzcWl2ItUK6HXOaeVWvqOt2rl6/
	ovghxJYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2qVq-000000046Ow-2ckq;
	Sat, 05 Sep 2026 13:32:54 +0000
Received: from m16.mail.163.com ([117.135.210.2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2qVm-000000046OV-3Z5u;
	Sat, 05 Sep 2026 13:32:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=Vv
	5oyIV+iTroIryK8q4maG4WM3D8XmfLPN5y+EKtsQ8=; b=hRbSmjZw69hGPwR3A3
	ipZw9GJiaGSslzOOkNu1xKXAswe05ODdCp7nz4P6xdJnrB9x8/zjd9UJAuY/uQlr
	mJQ3aF/l0+S9fVJB1gc5EjivlKhxz/N/APQzbCiFkVDDqo1UDRP4gXESMLl+lJ03
	AUnJcyyrlT3YqSyJY/HBHKO5M=
Received: from localhost.localdomain (unknown [])
	by gzsmtp2 (Coremail) with SMTP id PSgvCgD3_wzcGZxqt90VOw--.17760S2;
	Sat, 05 Sep 2026 21:32:13 +0800 (CST)
From: "hpp.iscas" <hppiscas@163.com>
To: Liam Girdwood <lgirdwood@gmail.com>
Cc: "hpp.iscas" <hppiscas@163.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Kai Chieh Chuang <kaichieh.chuang@mediatek.com>
Subject: [PATCH] ASoC: mt6351: Publish the OF module alias
Date: Sat,  5 Sep 2026 21:32:10 +0800
Message-ID: <20260905133210.63803-1-hppiscas@163.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-CM-TRANSID: PSgvCgD3_wzcGZxqt90VOw--.17760S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrtF43Jr4xXF4kJry3XFyrJFb_yoWfuFb_Cw
	48WayUurW8Cry7Cr4YqrsYvF4IqF1SkF1ktrn0kF18Xa47Xr1rZrsFqr17uayUZ3Z2qas8
	WFnxXF1ruFy3JjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7xRR9YFtUUUUU==
X-CM-SenderInfo: 5kssx2xfdvqiywtou0bp/xtbC7R0-CGqcGd1OvwAA3E
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260905_063251_391163_B3B5AA62 
X-CRM114-Status: UNSURE (   7.10  )
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

The MT6351 codec platform driver uses mt6351_of_match to bind devices=0D
with compatible mediatek,mt6351-sound. The codec can be a separate=0D
module, but the OF table is not exported to module alias metadata.=0D
=0D
Publish the existing table without changing codec matching, register=0D
access or the machine-driver configuration.=0D
=0D
Fixes: a74d51ba0e17 ("ASoC: add mt6351 codec driver")=0D
Signed-off-by: hpp.iscas <hppiscas@163.com>=0D
---=0D
 sound/soc/codecs/mt6351.c | 1 +=0D
 1 file changed, 1 insertion(+)=0D
=0D
diff --git a/sound/soc/codecs/mt6351.c b/sound/soc/codecs/mt6351.c=0D
index 1768c24..3be0491 100644=0D
--- a/sound/soc/codecs/mt6351.c=0D
+++ b/sound/soc/codecs/mt6351.c=0D
@@ -1478,6 +1478,7 @@ static const struct of_device_id mt6351_of_match[] =
=3D {=0D
 	{.compatible =3D "mediatek,mt6351-sound",},=0D
 	{}=0D
 };=0D
+MODULE_DEVICE_TABLE(of, mt6351_of_match);=0D
 =0D
 static struct platform_driver mt6351_codec_driver =3D {=0D
 	.driver =3D {=0D


