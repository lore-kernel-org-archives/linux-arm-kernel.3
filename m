Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADB56CCF9F0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Oct 2025 09:12:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4wC+BX5JHJh22xFyFCaf9pTUQBzIskjW9y1mFyt4bCA=; b=qIVIR56DRmjM+/uJQqxqSvp3Sa
	AcSfNVCXxFvhpmCq7HUpyyvjRqxluusr3Tfgf8i8cVZYYybiGrwEI5kMTQI+3QFBWwe5YX79MU5n2
	cjkR0rvGstl3OmQUlxnf6H1ZWjh6elji8qEWCnISO8mQKHLBf/czhJ/Scyl5la2rM/U3mnZQcD5fw
	bGI0X5bNBf7AqE7Vst2M2ZR6bSR+FxVTg4QKrepFqEKw3aW0hCfJcPlUkqfco+TBZeHNL6Z1BQJKM
	zbVjpzUnY54x0m2rlJ6SFnav+YvUvUCyqlDfYSmDy0Yk4J2BO4U3Ejl1VPV5GQLtYzUXo9SrnVoi5
	qjSyt/6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEOhg-00000003pKi-22ar;
	Thu, 30 Oct 2025 09:12:20 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEOhd-00000003pK2-2oyS;
	Thu, 30 Oct 2025 09:12:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1761815535;
	bh=pmnmnwp8/m2ORAIlHAGqy0ONXoHyVhsFhWbawbgS1bE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=NEYTi3eaTKnDHama9LO6XQp1uZO/PAA5LyfYvmJ7PdrszOaepTIN0jD1LoDtfXCYg
	 CQxphSawKF9v3X5EpQMXhZQ6T9dMDNH51bpfeT+pN+1NM8QN2jTlKQNmtuxJmx1CY8
	 iTbu82LMkEz3U3/4fG5w0CD8zeFqeUaJWwe93gvD1eG/L+SoPOXJaiyDxEehEjk9Vb
	 CH7yW80R2ASFzdC5TJOXe5/TGxJCHWDfNKXwm+btbiKw4329ZsrumiBpHdiF6bmogp
	 GaNlVj2QHuYNhpey/pRXHjiyoumEPUmUD/++ndHWBgtmI2W03tCiz4h1h2jVW8YkqT
	 ZsyAE8yU+bH8g==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 36C0517E139C;
	Thu, 30 Oct 2025 10:12:15 +0100 (CET)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, 
 Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Cc: kernel@collabora.com, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
In-Reply-To: <20251029-mtk-socinfo-mt8391-v1-1-61412dcd9938@collabora.com>
References: <20251029-mtk-socinfo-mt8391-v1-1-61412dcd9938@collabora.com>
Subject: Re: [PATCH] soc: mediatek: mtk-socinfo: Add entry for MT8391AV/AZA
 Genio 720
Message-Id: <176181553515.11821.362759210116954859.b4-ty@collabora.com>
Date: Thu, 30 Oct 2025 10:12:15 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251030_021217_879103_07268BAB 
X-CRM114-Status: UNSURE (   5.27  )
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

On Wed, 29 Oct 2025 14:46:43 +0100, Louis-Alexis Eyraud wrote:
> Add an entry for the MT8391 SoC with commercial name Genio 720.
> 
> 

Applied to v6.18-next/soc, thanks!

[1/1] soc: mediatek: mtk-socinfo: Add entry for MT8391AV/AZA Genio 720
      commit: 781bb149dae361eab5c8c1ece4d4c8ea953ecbf9

Cheers,
Angelo



