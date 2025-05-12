Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80F8CC3ABC3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 May 2025 14:07:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Date:Subject:Cc:To:From:Message-ID:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=XiZXeriwtNmD0C5rumTsjv/pcxn0w65lxRr71QDYu34=; b=jjZ8+VkRJqfvQe3zgKBrQPMj1a
	FUCaAbOE0JbyG4tER7WEGt9QeK6Ri7YcYgbaYV0pnfICfb7mVv9GAbCIm44UT2xTNgVyYz0XqKrIQ
	h2vWz7svpFU5iexfD65Q91LlKOizr92hzfpbkLHoxcvOFlc9q4lndcmPGkY612C70sbFncd4AzGU7
	NISP9LNIX+lpNZaU2P8610+5ZGgq3QxYm1UdZCuh7pWosfzhX+Z3KNGgRfFG7zZVvQa05NAoiRIhk
	CcB3jsh6aPRL0wapp4qAJ2ciePl9gqdXDKF2pFSIjurYhZi0tEZBy35YK14UGS/1+2Vz7Tp3L9Bu7
	wUSuVL1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uETny-00000009fW1-2e9j;
	Mon, 12 May 2025 14:06:54 +0000
Received: from out203-205-221-209.mail.qq.com ([203.205.221.209])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uET5n-00000009Weq-3G6v;
	Mon, 12 May 2025 13:21:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foxmail.com;
	s=s201512; t=1747056072;
	bh=XiZXeriwtNmD0C5rumTsjv/pcxn0w65lxRr71QDYu34=;
	h=From:To:Cc:Subject:Date;
	b=siE2ir6+/v11bGLYi0QrugKFp419zItyD6rE4YWj4rOyhxRSpkr5NWbNsHXtg8xHa
	 38eEXFFEaikcs8+aB6VWWdoyCcPP6QVVlrtAyjpUgIp96PneriQyk6wWQc+sfo40UP
	 QCota9OPNHF0GEgroLQeAZRk3ghsEijerUH4qW1M=
Received: from localhost.localdomain ([182.245.65.132])
	by newxmesmtplogicsvrszgpuc5-0.qq.com (NewEsmtp) with SMTP
	id 531AAC00; Mon, 12 May 2025 21:20:49 +0800
X-QQ-mid: xmsmtpt1747056049th6ukru0a
Message-ID: <tencent_D5C17F39C684CD6491505763B23BACCE5106@qq.com>
X-QQ-XMAILINFO: OAkMgjsCL21CLWoSijloNZ8D3K/VcR2BT8UYQcTgS3cymMCmEi2kyqjEkcmjST
	 JFCA1Y75FOEsVBqYs2d1+9hsWzPfSU5S7izWMysBdY4aD+JKY6KJMkw3o9nOmKh9UjiYC8Nm+Qv5
	 xwSll3Qhj3cihal+Y0T14XFVYc8vGmHg/YZsqA3ERRzPx2hP0GSKxtUp/HpHQF6fh8IfLgK5lDhg
	 IdSFha+jrlZT7BBUaOycXevaiukcxrGqAkoqyqPRGyyDiZBgidUQQsp/GD0AlkfWLDIiqLH9r1Cs
	 URGtD8YoG3RmCdBkS39q8zV2sBqG4HTl+Jw3jK9KNd7ucq2WlCdFqFeN/I8ktIx/9x7xaD8FM/6w
	 wwCw+8ZmEIdQXo+Cs2mSU6hymk2rSZz9qNZRF6hA0VgoE8thW2ZoGUdmpmooEVucNxM92pIsDx4v
	 aThk+IPYX4kz1Ba97zU3elCSRVCFAwZtvnU36izN7a9XyN2f8JJSZYKUbMaBnp1we6in1iC8bGnh
	 tfYBfA7ImSEEIgWNDc8hnUFpQLDDMqcFvToUIropz7GrjmMkKEViVGf4NGNjihjG+J1JX8p2rZUv
	 D+DuVKI/v6XTiJEKwozTlr6RzFw+6mPqgGUTCWiOZSJbmsPVra5GgmfVgO2s059NYgFdSjZv2Tj4
	 wyR9e15gfxgjylpHeYJ3svRrfMs2HVzhIIPYn0p95yvtav93UUxbnqWO3fv8iC7oq6Ue/dLXFDSp
	 L/DGurahKuGVHokwDtbQq0QLVDFK1x5tUXnc6Q7DjZ9vtJ1V58A6bZsnkpZfv8hR/2ezjPTmrOYb
	 2nZ6SCtk+8BEvJD2ycLtUoYlWNAoS0YDAmFbDg7/WnIxfumbxXTqE5bR2U7hE6zG3StUZ8n2tHXT
	 fS/pkADXaj+sgwZtIp+cC1EPexEWQeYhrq+gaXX3iFt44CyuCHLexwuz/SyvsM+ILrNJv2XEzVpW
	 rgiSDy3gzF1AvXxL/+hzV38lEJn7f7njRAEzKGim8UxuzECD0d74BoYMQN0wD/nVYebWY36ZJEVa
	 k+FENO5HDNArgOIdaNUqQ9yHnLxx+i/wcJzwLSeuHdZUlLZFy/rl/Bg1ag/8LLR9VM8fKpBw==
X-QQ-XMRINFO: NS+P29fieYNw95Bth2bWPxk=
From: chainsx@foxmail.com
To: robh@kernel.org
Cc: chainsx@foxmail.com,
	conor+dt@kernel.org,
	heiko@sntech.de,
	krzk+dt@kernel.org,
	sfr@canb.auug.org.au,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org
Subject: [PATCH v1 0/2] Add support for Firefly Station-M3/ROC-RK3588S-PC
Date: Mon, 12 May 2025 21:20:48 +0800
X-OQ-MSGID: <20250512132048.312772-1-chainsx@foxmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250512_062116_181749_E18F962B 
X-CRM114-Status: UNSURE (   9.58  )
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

From: Hsun Lai <chainsx@foxmail.com>

This series add support for Firefly Station-M3/ROC-RK3588S-PC.

Info of device can be found at:
https://wiki.t-firefly.com/en/Station-M3/index.html

Changes in v1:
- Add support for Firefly ROC-RK3588S-PC

Hsun Lai (2):
  dt-bindings: arm: rockchip: Add Firefly ROC-RK3588S-PC
  arm64: dts: rockchip: add DTs for Firefly ROC-RK3588S-PC

 .../devicetree/bindings/arm/rockchip.yaml     |   5 +
 arch/arm64/boot/dts/rockchip/Makefile         |   1 +
 .../boot/dts/rockchip/rk3588s-roc-pc.dts      | 911 ++++++++++++++++++
 3 files changed, 917 insertions(+)
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3588s-roc-pc.dts

-- 
2.34.1


