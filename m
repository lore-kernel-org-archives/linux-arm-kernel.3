Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EFA61061B1F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Mar 2026 20:39:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:Cc:To
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JQFTEDrfiAcnWN3PPrmbTznv/cFOH1dKZ+goNeN26I4=; b=pOtncG6NneFnHjJT9MopAAhewC
	8+EbE2uumFMSkcyTNMu2Clof1DzuAOQqf/BNCsMhsbHVD0AGSOveaxCaVl4AtuHM6BoTOJxje0c09
	dUqT82Cee1V3GWdewZHSwLMJzqByMKc6DicTShlFGRYj2VO9M4glJtpjNxQoVT9rOHdTZHEN4OdsC
	Ifhzh5Suj+qrH18kk5u2mpp9rzD3xVIUWeTXjtSIcUYy+kgzWWB0qb+UdfRaWkUiX0MWxOd0hWhcA
	YG6SiduKjkxFt3L+PjQibdIPvxDHZuJHdLAMKWBALAhZ1oz3/dsiYDpDWPsgCTMi2/pTH4YbpZRRa
	cMtFCTwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7JOo-0000000BqYs-14zc;
	Mon, 30 Mar 2026 20:39:50 +0000
Received: from fout-a7-smtp.messagingengine.com ([103.168.172.150])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7JOU-0000000BqHu-3qZ1;
	Mon, 30 Mar 2026 20:39:32 +0000
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfout.phl.internal (Postfix) with ESMTP id 8ECB1EC026B;
	Mon, 30 Mar 2026 16:39:29 -0400 (EDT)
Received: from phl-imap-07 ([10.202.2.97])
  by phl-compute-02.internal (MEProxy); Mon, 30 Mar 2026 16:39:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jetm.me; h=cc:cc
	:content-transfer-encoding:content-type:content-type:date:date
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1774903169;
	 x=1774989569; bh=JQFTEDrfiAcnWN3PPrmbTznv/cFOH1dKZ+goNeN26I4=; b=
	RGC9roMb53Y8xjPGxZAnZnQj9HcXaHCLS7tnenXBU2YjEKO8Qcx8VcTvSaWa/UtW
	k5alB3m3/rKCBHD6bI+2t65XmjU/ULdSlSYuHxdSHyHYC4o+ud6jhc5CfaPwjLOX
	PubJp/BEhCnq3mqPNcqpt7E2714tKuCRH+jCYeelMep2SzQ5zMVL9IFdx1WoNyr1
	B71wHyOisLqk9k7P2mNSMqjrqfQyeytjINwixHP/wmfCxd/+2S2bObqnhjqf0oMO
	Oy04vhIc63LiAP/eF1/OU/osz1OG9UYnUkRakiqSeUP/Cc0TGbl4jDXNy+D8DncX
	Vt6GEWN7szjv1r5n0oUVZw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1774903169; x=
	1774989569; bh=JQFTEDrfiAcnWN3PPrmbTznv/cFOH1dKZ+goNeN26I4=; b=F
	dVHAcgvb8gVxbmu30RJ9qjXAhuUxojA2b4moNdERvrC42w3BytaoUopLZSl874eX
	+eKCvdl23vzfbSWD0/kXNLXPQUcOGrJRiMJeYUlNtU1gezbbV3x9vvaEkoWXkQWG
	NA9y3nGZ7s6nJn8oElKVAJdGJ1vmjKEaYt4MUeyuaySKm7vR6Ezqq8ZDyZGQ0p48
	QwvPbd7puWNJUtYg2Q2htoDvrbWva2J9oZbtnSZYVw53tRCQ0SHqfYKO47YZPa9n
	iqIrge2IfZZjxFCYWJ3qFbJn0D55L2P13pKw66l6uko7XTEga0kG+5jvXtHQ5oAc
	8g6BcuKs1u+n67MJCdLgw==
X-ME-Sender: <xms:gd_KaSQ68BrWZjBxZ04wGYm2AwC15bw29ErQgqMGNbwlvwRUIvhPlg>
    <xme:gd_KaSntQ_lNLFv2APAlVMvm0DCoa8PyTVN-jCtW6eADAtQqF1prMSQaFqKz2QCw9
    HcA2-GDTB92mQKS3ljwGvZmw_sdvUOcucsdXq3hZNhSjfhC56RNBAY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdeffeelleeiucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepoffhfffugggtgffkvfevofgjfhesthejredtredtjeenucfhrhhomheplfgrvhhi
    vghrucfvihgruceofhhlohhsshesjhgvthhmrdhmvgeqnecuggftrfgrthhtvghrnheptd
    fghefflefhieffveevtedttdejudefueetvdevvdfffeegffeludevgeehteetnecuffho
    mhgrihhnpehgihhthhhusgdrtghomhenucevlhhushhtvghrufhiiigvpedtnecurfgrrh
    grmhepmhgrihhlfhhrohhmpehflhhoshhssehjvghtmhdrmhgvpdhnsggprhgtphhtthho
    peelpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopegrnhhgvghlohhgihhorggttg
    hhihhnohdruggvlhhrvghgnhhosegtohhllhgrsghorhgrrdgtohhmpdhrtghpthhtohep
    lhhuihiirdguvghnthiisehgmhgrihhlrdgtohhmpdhrtghpthhtohepmhgrthhthhhirg
    hsrdgsghhgsehgmhgrihhlrdgtohhmpdhrtghpthhtohepgigvlhhnrghgrgesghhmrghi
    lhdrtghomhdprhgtphhtthhopehmrghrtggvlheshhholhhtmhgrnhhnrdhorhhgpdhrtg
    hpthhtoheplhhinhhugidqrghrmhdqkhgvrhhnvghlsehlihhsthhsrdhinhhfrhgruggv
    rggurdhorhhgpdhrtghpthhtoheplhhinhhugidqmhgvughirghtvghksehlihhsthhsrd
    hinhhfrhgruggvrggurdhorhhgpdhrtghpthhtoheplhhinhhugidqsghluhgvthhoohht
    hhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnh
    gvlhesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:gd_Kadwh5xW49P5NRt7KL3ftZpOTtjPfThDS5F1n_6JWjBrhRR9aAg>
    <xmx:gd_KaQUUGisqcz8scXOFYMFtbBpZuq2o9h0zz-8sM6uP9wxF_erwfw>
    <xmx:gd_KaR_c0O4buppEHuSMz32bdzocVorLB1Zxgy45zb4szozvbG2nTw>
    <xmx:gd_KabsKSPzWgqvesh_mCh967iGWwjGySh6hyD_ejpJTZ_Mao-A8xw>
    <xmx:gd_KaasNzrwlAIcDiG6ubxbBnpmpjen4ku2K3qaKT_dcYQ4O1GrNPHwU>
Feedback-ID: i9dde48b3:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 6C1951EA006B; Mon, 30 Mar 2026 16:39:29 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
From: Javier Tia <floss@jetm.me>
Date: Mon, 30 Mar 2026 14:39:24 -0600
Subject: [PATCH v4 2/8] Bluetooth: btmtk: fix ISO interface setup for
 single alt setting
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260330-mt7927-bt-support-v4-2-cecc025e7062@jetm.me>
To: Marcel Holtmann <marcel@holtmann.org>,
 Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-bluetooth@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Ryan Gilbert <xelnaga@gmail.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1386; i=floss@jetm.me;
 h=from:subject:message-id; bh=BeW2hWsgHTDse1WiYc/ZGW8ev0c1HREFra5Yo0QtNu0=;
 b=owEB7QES/pANAwAKAbXuwwuoZ3cfAcsmYgBpyt96xQLJ1xKInvOGY+L6/3C/N96NX9Sl453n9
 7Hr8Stf68qJAbMEAAEKAB0WIQSbE7ILzw7eI0VKk8m17sMLqGd3HwUCacrfegAKCRC17sMLqGd3
 H9HXC/0RTzkQgqOzxN7Hd+6yML4k0nhRPO1lySrwjRVrtobdHKih5L+DG9DYUYFm7eGDbPVwlpf
 BwtsVW15midbi073Np0k3I/wSAP8MThWbBjkyQvc2eULC5Q6z52Pz5qjFOk+bCrkKf14VjlcJQ3
 EbgYWIkDDiOnr2moHM9fIRm9g00dRe53wVjmJsUPq/oNVJAGhdlwZd4mJ34zxcDufKdZTDNvYQm
 bZFQprR/RdRhzmaqoNgWH10VDj0rz0cgt+0aXzIhTWvJVoa6dIIx3/OAF4VxVcF/t35IfdN1aYG
 gAW6YbS2EfZe1BeDQsalp1pBH0aU4kODXY8r7YR+ge3Mud1WwUb2/J2BVaRHtzYx5jMcf1BLy0n
 CuWWxno3YvDfPmA2gFiNNY5Wlk1ZjI9TV49qnQEUYNZWeZNRftfJHFWvluRZfAWyhEUNSdyQuHb
 qx4Vl4rB7n7Nsi7hYk4tY+/GePkiqb7DL7XfHWkGL3pKEiKa9zc2zxFvdVIoqhxrO0+lA=
X-Developer-Key: i=floss@jetm.me; a=openpgp;
 fpr=9B13B20BCF0EDE23454A93C9B5EEC30BA867771F
In-Reply-To: <20260330-mt7927-bt-support-v4-0-cecc025e7062@jetm.me>
References: <20260330-mt7927-bt-support-v4-0-cecc025e7062@jetm.me>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260330_133931_025120_B920D4FB 
X-CRM114-Status: GOOD (  10.49  )
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

Some MT6639 Bluetooth USB interfaces (e.g. IMC Networks 13d3:3588 on
ASUS ROG STRIX X870E-E and ProArt X870E-Creator boards) expose only a
single alternate setting (alt 0) on the ISO interface. The driver
unconditionally requests alt setting 1, which fails with EINVAL on
these devices, causing a ~20 second initialization delay and no LE
audio support.

Check the number of available alternate settings before selecting one.
If only alt 0 exists, use it; otherwise request alt 1 as before.

Closes: https://github.com/jetm/mediatek-mt7927-dkms/pull/39
Signed-off-by: Javier Tia <floss@jetm.me>
Reported-by: Ryan Gilbert <xelnaga@gmail.com>
Tested-by: Ryan Gilbert <xelnaga@gmail.com>
---
 drivers/bluetooth/btmtk.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/bluetooth/btmtk.c b/drivers/bluetooth/btmtk.c
index 4af19b86c551..f8cff895f14c 100644
--- a/drivers/bluetooth/btmtk.c
+++ b/drivers/bluetooth/btmtk.c
@@ -1029,7 +1029,8 @@ static int __set_mtk_intr_interface(struct hci_dev *hdev)
 	if (!btmtk_data->isopkt_intf)
 		return -ENODEV;
 
-	err = usb_set_interface(btmtk_data->udev, MTK_ISO_IFNUM, 1);
+	err = usb_set_interface(btmtk_data->udev, MTK_ISO_IFNUM,
+			       (intf->num_altsetting > 1) ? 1 : 0);
 	if (err < 0) {
 		bt_dev_err(hdev, "setting interface failed (%d)", -err);
 		return err;

-- 
2.53.0


