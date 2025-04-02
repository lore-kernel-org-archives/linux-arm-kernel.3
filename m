Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 102EBC28B20
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Apr 2025 11:48:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Subject:Cc:To:
	From:Mime-Version:Message-ID:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=TWXlAzRjdA16lx+TkBh7jum+NXYcBB/5jqvSE1gerEA=; b=qSH1mP2Hb3Yu/bbdgxbWcVaCim
	US41bacuMkmorpcTc+jZmbw/cT/jwiUVn2ykKau8sEN5e2Dt4/LxGVq1MUL87sbAGhyCLIMOI4Myo
	28xgg24Y76FgsR8AwT8WBlJupa8P3WI0sVO6hgkmzYOrhD9TPEW2McFVDMam5SXB63wkJZFeNt3j0
	xwqwnqtmoDVy24XHph9Bcajd1MMVlbnHY3e8VQ3TGJDjYM4jai5/8OHoWGYqenSz0xSSSZZXGzy24
	SY2m3VPaZ5MxuZM+Bqp2aCqpohZD3gLT2oZ0GTxns89FovRJf88n1NU1O0nYLWVnqNe9c+GZB/eDr
	L+G0kMqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzwZx-00000005xyA-0fwv;
	Wed, 02 Apr 2025 11:48:21 +0000
Received: from mxct.zte.com.cn ([183.62.165.209])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzwP5-00000005vQz-1Tpj
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Apr 2025 11:37:09 +0000
Received: from mse-fl1.zte.com.cn (unknown [10.5.228.132])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mxct.zte.com.cn (FangMail) with ESMTPS id 4ZSNBH2CBpz51SWC;
	Wed,  2 Apr 2025 19:36:55 +0800 (CST)
Received: from xaxapp05.zte.com.cn ([10.99.98.109])
	by mse-fl1.zte.com.cn with SMTP id 532Baqs5065074;
	Wed, 2 Apr 2025 19:36:52 +0800 (+08)
	(envelope-from shao.mingyin@zte.com.cn)
Received: from mapi (xaxapp01[null])
	by mapi (Zmail) with MAPI id mid32;
	Wed, 2 Apr 2025 19:36:56 +0800 (CST)
Date: Wed, 2 Apr 2025 19:36:56 +0800 (CST)
X-Zmail-TransId: 2af967ed215810b-249fc
X-Mailer: Zmail v1.0
Message-ID: <20250402193656279azy9TKahAE5TQ5-i4XCQT@zte.com.cn>
Mime-Version: 1.0
From: <shao.mingyin@zte.com.cn>
To: <thierry.reding@gmail.com>, <laurent.pinchart@ideasonboard.com>
Cc: <mperttunen@nvidia.com>, <airlied@gmail.com>, <simona@ffwll.ch>,
        <jonathanh@nvidia.com>, <dri-devel@lists.freedesktop.org>,
        <linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <laurent.pinchart@ideasonboard.com>, <tomi.valkeinen@ideasonboard.com>,
        <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
        <tzimmermann@suse.de>, <michal.simek@amd.com>,
        <linux-arm-kernel@lists.infradead.org>, <yang.yang29@zte.com.cn>,
        <xu.xin16@zte.com.cn>, <ye.xingchen@zte.com.cn>,
        <zhang.enpei@zte.com.cn>
Subject: =?UTF-8?B?W1BBVENIIGxpbnV4LW5leHQgMC8yXSBVc2UgZGV2X2Vycl9wcm9iZSgpIGluIGdwdQ==?=
Content-Type: text/plain;
	charset="UTF-8"
X-MAIL: mse-fl1.zte.com.cn 532Baqs5065074
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 67ED2157.004/4ZSNBH2CBpz51SWC
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250402_043707_562408_F73F221E 
X-CRM114-Status: UNSURE (   5.76  )
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

From: Zhang Enpei <zhang.enpei@zte.com.cn>

Use dev_err_probe() to simplify the following code
sequence:
  if (err != -EPROBE_DEFER)
      dev_err(dev, ...);
  else
      dev_dbg(dev, ...);
  return err;

Zhang Enpei (2):
  gpu: drm: tegra: dpaux: Use dev_err_probe()
  gpu: drm: xlnx: zynqmp_dp: Use dev_err_probe()

 drivers/gpu/drm/tegra/dpaux.c    | 11 +++--------
 drivers/gpu/drm/xlnx/zynqmp_dp.c |  6 ++----
 2 files changed, 5 insertions(+), 12 deletions(-)

-- 
2.25.1

