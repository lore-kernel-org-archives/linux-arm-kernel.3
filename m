Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F7A8CD343F
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 May 2026 13:33:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QdSOPYHhbIllJ5J2g4DcN9wLr71AjbsQu05Yehlq92o=; b=Ik2mQVUUrLSXIKWRufqXvQiugF
	LT+ZPXdVWV1jb1UuhfjufoR5fvtjwJDSuAouvkvd1V0xXrV1YeLuQRbEwPAPsWiaCiB90hPV/SxAK
	j2Q8AilfCK1WqAyuBpzxwX5koGWU0AuUpcstrONCk4O+okIw+CiZMbhK2UXETbmTDTGRhMAAaaevl
	rVZjbr5RmHnZqRMb9uf8DTvWQUxR38p/Ee0QfKLjiRWPJGkiWKDSfkjCP9NB8drJ6KE2gbki0hJb2
	J2o8GbpULCQgueeHYeqcyTt2wDzx2XHqGnf7uGkcNhrB79N1Y7Xp1pehtvQdHrTDGKiJmiJLuCM6z
	Iqz29mEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKyqc-00000003uho-3cX0;
	Thu, 07 May 2026 13:33:02 +0000
Received: from pidgin.makrotopia.org ([2a07:2ec0:3002::65])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKyqa-00000003ugH-39IO;
	Thu, 07 May 2026 13:33:01 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.99)
	(envelope-from <daniel@makrotopia.org>)
	id 1wKyqO-000000005G2-3cSu;
	Thu, 07 May 2026 13:32:48 +0000
Date: Thu, 7 May 2026 14:32:45 +0100
From: Daniel Golle <daniel@makrotopia.org>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Junzhi Zhao <junzhi.zhao@mediatek.com>,
	Jie Qiu <jie.qiu@mediatek.com>, dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 2/2] drm/mediatek: hdmi: report jack plugged state from
 bridge enable/disable
Message-ID: <afyUfcr8HuFs6EKF@makrotopia.org>
References: <a3e22cbae528c9a38d854a586d1736b860998d41.1776265222.git.daniel@makrotopia.org>
 <c4d62fc2244fb72207855c5a366ff10fad419f2d.1776265222.git.daniel@makrotopia.org>
 <lhxivpwo6aq3ehgzsnkgxnqis5tptmey4dtbhaokyckkl7ghbn@dzaj225pnpk3>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <lhxivpwo6aq3ehgzsnkgxnqis5tptmey4dtbhaokyckkl7ghbn@dzaj225pnpk3>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260507_063300_799434_0917143F 
X-CRM114-Status: GOOD (  18.86  )
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

On Thu, May 07, 2026 at 12:51:56PM +0300, Dmitry Baryshkov wrote:
> On Wed, Apr 15, 2026 at 04:04:16PM +0100, Daniel Golle wrote:
> > Notify hdmi-codec of the current sink plugged state from
> > mtk_hdmi_bridge_atomic_enable() and mtk_hdmi_bridge_atomic_disable()
> > via mtk_hdmi_update_plugged_status(). This matches the pattern used
> > by dw-hdmi, which invokes handle_plugged_change() from the bridge
> > enable and disable paths so that ASoC jack state stays in sync with
> > the actual sink presence across atomic commit cycles, and not only
> > on CEC HPD transitions.
> > 
> > Userspace audio daemons (e.g. pipewire) rely on the jack state to
> > route streams, restore per-sink volume levels, and recover the last
> > used device after a reconnect. Without this, those transitions are
> > missed whenever the sink change is driven by a mode set rather than
> > by a bare HPD event.
> 
> I can only hope to see mtk_hdmi to migrate to DRM_BRIDGE_OP_HDMI and
> DRM_BRIDGE_OP_HDMI_AUDIO...
> 
> I think the correct timing was discussed several times and the overall
> conclusion was that the correct time is when the actual HDMI cable is
> being plugged / unplugged. See the discussion around [1] and the
> captured response of Mark Brown.

Thank you for bringing this to my attention. I'll follow up on it.
Meanwhile, can (independent) patch 1/2 already be merged, or at least
get reviewed?

