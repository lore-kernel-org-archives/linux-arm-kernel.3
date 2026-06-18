Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02536CD98F3
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Jun 2026 11:14:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:From:
	To:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8Mcydhro1EQOrm5osOZpAWTi5DUtUM3BYZKMBUyg4Pk=; b=Sn6owrUFsLvWlbbLofm0v4tNl9
	7LlvyY0oApKspszZSMCZWjyq/v3Ehfka0vhWGnTclW2wNbeiFmE3YlMf8Ys0bXzCTb1m6bjQ2j24R
	3aKKQZhvzhu+w1rv2cp5JK/TebEKVWjaHahwt6T15g19Htemh4VhyLBfXu3h0Gf27eaZ8bDZjl8qm
	vHICqeUKFHKGOCNXWHI9ho3LLIgvgLKJhG6oJSiubWZsCbfZj5Zfiim5oyhdFebM2JXd/cK+470kC
	avYYbOsBLVO07ZR6arwFRJXNyZVry0paYvf6+gT9D2YJL4Ii2XUx4jfPQ48atJXsC3Y7FbqMrNBf3
	DCNg9WIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wa9qL-000000015JR-09Al;
	Thu, 18 Jun 2026 10:19:29 +0000
Received: from mail-4316.protonmail.ch ([185.70.43.16])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wa9qD-000000015Fv-1kvq;
	Thu, 18 Jun 2026 10:19:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1781777956; x=1782037156;
	bh=8Mcydhro1EQOrm5osOZpAWTi5DUtUM3BYZKMBUyg4Pk=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=nK7bb7ZRz/raM9vKiEuw2B8SB72kmXNIWSGb1I9kKZSg3V7AhryINDsgV9HdiqsF8
	 qkPFddqGClntpGCOx1/zZUPfa/Y97PArNKbUadPeQ6xRFZBqUcT3TX871YfQ7/1nzg
	 I4FS+iqDiTf5n3QB20JA2iIQEWNd3S/UW9nNwJhBnpnQoYfOxHCXwnvaJwhHqMQNFd
	 bMrMvJFtKSj+WCI4fQP3eHb2/1sc7LQE15VSmd8wkXT1pKnexeWl4xVE73RugBu5RO
	 dKt96ljAPrGuSpLmoQM7Wg/4cYFJ8CgKmMUUUwAjqKMDJ7+xXGqVMjI+HZwkp3vEam
	 buBKd6G/48d7A==
Date: Thu, 18 Jun 2026 10:19:10 +0000
To: majordomo@vger.kernel.org
From: Clint <t1m3band1t@proton.me>
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Cheng-Yi Chiang <cychiang@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>, Guenter Roeck <groeck@chromium.org>, Benson Leung <bleung@chromium.org>, David Rhodes <david.rhodes@cirrus.com>, Richard Fitzgerald <rf@opensource.cirrus.com>, povik+lin@cutebit.org, Charles Keepax <ckeepax@opensource.cirrus.com>, Support Opensource <support.opensource@diasemi.com>, Nick Li <nick.li@foursemi.com>, Herve Codina <herve.codina@bootlin.com>, Srinivas Kandagatla <srini@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>, Oder Chiou <oder_chiou@realtek.com>, Lars-Peter Clausen <lars@metafoo.de>, nuno.sa@analog.com, Steven Eckhoff <steven.eckhoff.opensource@gmail.com>,
	patches@opensource.cirrus.com, chrome-platform@lists.linux.dev, asahi@lists.linux.dev, linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, bui duc phuc <phucduc.bui@gmail.com>
Subject: Re: [PATCH 05/78] ASoC: codecs: aw87390: Use guard() for mutex locks
Message-ID: <5TNHQg1ajwrqUAIsNxt-sPNM5rRRTZgaIB6ssPE1Wymu_gKMW58Xm1iE3BkLh8pyvSGSBb-sxBK-2r_Hveh59vOyQofKZ_C630-gdnT4uMw=@proton.me>
In-Reply-To: <20260617103235.449609-6-phucduc.bui@gmail.com>
References: <20260617103235.449609-1-phucduc.bui@gmail.com> <20260617103235.449609-6-phucduc.bui@gmail.com>
Feedback-ID: 162116597:user:proton
X-Pm-Message-ID: 621a7e4fd1b7e784c26703ddbd3c88a4c50a0740
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260618_031922_247773_3569B319 
X-CRM114-Status: UNSURE (   7.53  )
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

unsubscribe linux-kernel
unsubscribe linux-sound
unsubscribe linux-arm-kernel


Clint

-------- Original Message --------
On Wednesday, 06/17/26 at 20:34 phucduc.bui@gmail.com wrote:
From: bui duc phuc <phucduc.bui@gmail.com>

Clean up the code using guard() for mutex locks.
Merely code refactoring, and no behavior change.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/codecs/aw87390.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/sound/soc/codecs/aw87390.c b/sound/soc/codecs/aw87390.c
index 020213e0ca4b..88110e720f85 100644
--- a/sound/soc/codecs/aw87390.c
+++ b/sound/soc/codecs/aw87390.c
@@ -225,11 +225,10 @@ static int aw87390_profile_set(struct snd_kcontrol *k=
control,
 =09struct aw87390 *aw87390 =3D snd_soc_component_get_drvdata(codec);
 =09int ret;

-=09mutex_lock(&aw87390->lock);
+=09guard(mutex)(&aw87390->lock);
 =09ret =3D aw87390_dev_set_profile_index(aw87390->aw_pa, ucontrol->value.i=
nteger.value[0]);
 =09if (ret) {
 =09=09dev_dbg(codec->dev, "profile index does not change\n");
-=09=09mutex_unlock(&aw87390->lock);
 =09=09return 0;
 =09}

@@ -238,8 +237,6 @@ static int aw87390_profile_set(struct snd_kcontrol *kco=
ntrol,
 =09=09aw87390_power_on(aw87390->aw_pa);
 =09}

-=09mutex_unlock(&aw87390->lock);
-
 =09return 1;
 }

@@ -280,14 +277,12 @@ static int aw87390_request_firmware_file(struct aw873=
90 *aw87390)
 =09=09return ret;
 =09}

-=09mutex_lock(&aw87390->lock);
+=09guard(mutex)(&aw87390->lock);

 =09ret =3D aw88395_dev_cfg_load(aw87390->aw_pa, aw87390->aw_cfg);
 =09if (ret)
 =09=09dev_err(aw87390->aw_pa->dev, "aw_dev acf parse failed\n");

-=09mutex_unlock(&aw87390->lock);
-
 =09return ret;
 }

--
2.43.0




