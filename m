Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 383C0C531F9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Jul 2026 16:09:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:
	Content-Transfer-Encoding:Mime-Version:To:From:Cc:Subject:Message-Id:Date:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nY/9cNDgunK0zPnBuyoaT1LrnFCnyLxA3wO1Cxxn2F8=; b=Fbk7XyhUDGaqHfaK6ArVPU7U6y
	Wzu4BNimfHVYi4WrDJXgXbb0n+M0MZAQPPNbvemG8SSmgP9M2TvEUVaCZ9Gs7IGC9JLcJfJnjx3yR
	3k4fOSYlkhcHhBu81LPcQ113kfJTigebflZMQBQ1SimAldz9V/TCdv8MlrHhxHUyIXze0dMYitMvx
	u5IwACt0Er85lUdVNxrcfUg8oVtl63EFgjNoAzKRQYmaFqq/oB8gbehSlz8bpNqTFxknXjJNeBuHx
	DDwmphs5Iqwhql25P2oGSyawxdmnxsCXYzL+4IGdfwCQU5vNaw3UYdz+Ci4CyR3+A9LIobGtVbA8a
	QHGgqGJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wokMa-00000005mrF-3QHF;
	Tue, 28 Jul 2026 16:09:04 +0000
Received: from sendmail.purelymail.com ([34.202.193.197])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wokMX-00000005mq1-30Cg
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Jul 2026 16:09:02 +0000
Authentication-Results: purelymail.com; auth=pass
DKIM-Signature: a=rsa-sha256; b=l3F46aSmkFjbDMkvZyRLDqImJ+0Lly+fJpq91VYTlIdfGTGI3T3JkVCrm4zLtacaJjjm3Qu/8whd0mKQVnwORd58j/qc6fJxA5+XLExezed9tsmmD74uGbs+8OtTe+t0q3wivfKLXiatDHJgbxa5JQoUxIDX8dpwDmDOXF+isKhbzlj2HIZIrJOJF/tbZ1q4/1nHWo7D4sn9nT93M8k4AivQkUQbbpFjKXWeY/KQIuAzdK71t6NuE3+frkOZyt39DcRrolBf8tB9b847THB+RHxrOUIH9UmfOPMfDXKVITjgg7W6trM2L1zF5YTTn/F/S8L0c1t6SIyd8ogHdNpDjg==; s=purelymail3; d=rcpassos.me; v=1; bh=M5kzdAEoPc5rbNRA4KFaC+3yUnwETH5W42yryDQOE1E=; h=Received:Date:Subject:From:To;
DKIM-Signature: a=rsa-sha256; b=P5zPGlB5yHHFcn3IccLp9PNbpyOLLiRLnkBkOfCwxBebxPWXMhDF824GmHB3kh0mYAKqnuUh2V2z1LNtYgjlm6GrzH/5awBF4ueoGX2ZdnGJ3AZ3KiPr+e0Zy3l1XjMtNBMe7vRNaKtdpK6mReb8hBbuJIreaUDAOQ9EWE0vIotUnSVj9R7YNm3HYKRwwX04c8YjB/utJpD8nrjkuaxIbsGixf2otmkbWYseXM4p+XB3d0GQrf4wbil3ET6/ORlMSfEE/jINnjGdUTMgXyRjJTpyJfiNt6Ft/xNzM6CVc0YvQRnda3Aw5uMwlTwlTsBl5dJCVc3XQIHWxr53q5q62A==; s=purelymail3; d=purelymail.com; v=1; bh=M5kzdAEoPc5rbNRA4KFaC+3yUnwETH5W42yryDQOE1E=; h=Feedback-ID:Received:Date:Subject:From:To;
Feedback-ID: 45355:7809:null:purelymail
X-Pm-Original-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -1239418384;
          (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
          Tue, 28 Jul 2026 16:08:37 +0000 (UTC)
Content-Type: text/plain; charset=UTF-8
Date: Tue, 28 Jul 2026 13:08:33 -0300
Message-Id: <DKAC1T7FWOBS.15ACCNTX4EOFA@rcpassos.me>
Subject: Re: [PATCH v2] Bluetooth: Properly disable remote wakeup for
 MT7922/MT7925 on Ryzen platform
Cc: "Luiz Augusto von Dentz" <luiz.von.dentz@intel.com>,
 =?utf-8?b?Q2hyaXMgTHUgKOmZuOeomuazkyk=?= <Chris.Lu@mediatek.com>,
 =?utf-8?b?V2lsbC1DWSBMZWUgKOadjuaUv+epjik=?= <Will-CY.Lee@mediatek.com>,
 =?utf-8?b?U1MgV3UgKOW3q+aGsuasoyk=?= <ss.wu@mediatek.com>,
 <linux-bluetooth@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>
From: "Rafael Passos" <rafael@rcpassos.me>
To: "Rong Zhang" <i@rong.moe>, "Rafael Passos" <rafael@rcpassos.me>, "Marcel
 Holtmann" <marcel@holtmann.org>, "Luiz Augusto von Dentz"
 <luiz.dentz@gmail.com>, "Matthias Brugger" <matthias.bgg@gmail.com>,
 "AngeloGioacchino Del Regno" <angelogioacchino.delregno@collabora.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: aerc 0.21.0
References: <20260701-btmtk-ryzen-remote-wakeup-v2-1-767ac7907472@rong.moe>
 <DJRKO72HWZOI.QJYJUAC45QOJ@rcpassos.me>
 <79D5F3E6-8F40-4422-BB2D-16691E377394@rong.moe>
 <DJRP3YO7Y0WK.20KNRZIMX1CYK@rcpassos.me>
 <F16A2A9A-A43F-45FE-8CC0-44A129360D47@rong.moe>
 <DKA8F33O8HID.2UV2DWTLE6S48@rcpassos.me>
 <133c4858657c55b31affd4bff1cbd68f812de5e1.camel@rong.moe>
 <DKAA9VN5E4DS.2U03T6V5HEAAE@rcpassos.me>
 <1ba1545c318214d988e899a95279b4b0f93bc24e.camel@rong.moe>
In-Reply-To: <1ba1545c318214d988e899a95279b4b0f93bc24e.camel@rong.moe>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260728_090901_844455_0491679F 
X-CRM114-Status: UNSURE (   9.06  )
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

Hi Rong,
On Tue Jul 28, 2026 at 12:38 PM -03, Rong Zhang wrote:
> You snipped too many lines. There should be a line similar to
>
>            |                               +-0c.0-[0d]----00.0  Advanced =
Micro Devices, Inc. [AMD] XXXX [YYYY:ZZZZ]
>
> which is the root hub.

Indeed.
+-02.1-[04-0e]----00.0-[05-0e]--+-00.0-[06]--
|                               +-02.0-[07]----00.0  MEDIATEK Corp. MT7925 =
(RZ717) Wi-Fi 7 160MHz [14c3:0717]
|                               +-03.0-[08]----00.0  Realtek Semiconductor =
Co., Ltd. RTL8125 2.5GbE Controller [10ec:8125]
|                               +-04.0-[09]--
|                               +-05.0-[0a]--
|                               +-06.0-[0b]--
|                               +-08.0-[0c]----00.0  Sandisk Corp SanDisk E=
xtreme Pro / WD Black 2018/SN750/PC SN720 NVMe SSD [15b7:5002]
|                               +-0c.0-[0d]----00.0  Advanced Micro Devices=
, Inc. [AMD] 800 Series Chipset USB 3.x XHCI Controller [1022:43fc]
|                               \-0d.0-[0e]----00.0  Advanced Micro Devices=
, Inc. [AMD] 600 Series Chipset SATA Controller [1022:43f6]

> In the foreseeable future I am not going to have a desktop platform ($$$)
I was lucky to upgrade before prices went up.
> so I can't easily debug the issue myself. Hence, it would be helpful if
> you could reliably reproduce the issue, so that we can have an in-depth
> debug. But let's forget it for the time being since your device works
> fine now!

I wouldn't mind helping debug this.
I will look into buying the M.2 a/e -> USB and the PCI -> M.2 a/e.
The bug first happened when I switch from Arch do Debian, months ago...
If I can reproduce it, I will reply to this thread.

Thanks,
Rafael Passos


