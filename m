Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C041CAC582
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Sep 2025 17:17:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:From:
	Subject:Cc:To:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZXsBWUVEToRG9hwWAZ2hDQlZcigvLyFJJHvcWPbMinA=; b=0CuRtkwcV2GmpyueslNtmhOQya
	YaaROIBxiAiw9CHefG5CL2qta0KxlUAP0W06fbhYrXkGZ52RSmouM8vCsYMwLuOHcgie5kZ7V3RdM
	vou7ZpTrmZwyPz8KHgJmVQMBD/DvUuoL2gnutEsRd7e8HL9BGZLgr1+/ZO5Ui8m8VjDTY4v8WVTF/
	umL371LeAXFrVNd6oeD71ZCWMyaSYtLB5EMeJIrN6iF8CKNJWlZrJy/QkSjJO7+wkRlhMh1VbtQJj
	oOhfT3kdcICGWHEEEqKQY7jWZ2BD7absNY5rGrk2e35dH2szlREfUKy0pFvU53SMELET7nsdY2KL6
	u1vHe62g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw1xc-00000008qN1-3JcZ;
	Tue, 09 Sep 2025 17:16:52 +0000
Received: from sendmail.purelymail.com ([34.202.193.197])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvwul-00000006tEY-0ujq
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Sep 2025 11:53:36 +0000
DKIM-Signature: a=rsa-sha256; b=HB7JOBq07d27/uRMofVuysMRx3jKZ9qs285MC087RL5HNu0wBaPGA2VzmF/ipF2AX9XqytGqWILeKp3++xOFMLiyTlHtVkSd1c4nLBRpDxKEnINMBHTwshtKLnYBuv4Pvki/4/f71mPbZeHZlX8CStVVjTWjUb9MDbBjzlqMASFGjojdqXM3IdDB5yxN4R5BBsWUDaww2l3d8IYjROpEI2QKgxmJjFDOjCRgKD/0PDD/boXCtwhpnFd7iPyT9RicWijUtUoxf6R/QVPN3lOZcf/gs2HKWU8I4hL4a3mWrPPg9gWJrECpQKyZb0fr38ONjid1Tk+atU0pF5vgBm6QJA==; s=purelymail2; d=purelymail.com; v=1; bh=ZXsBWUVEToRG9hwWAZ2hDQlZcigvLyFJJHvcWPbMinA=; h=Feedback-ID:Received:Date:To:Subject:From;
Feedback-ID: 68247:10037:null:purelymail
X-Pm-Original-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 1767750111;
          (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
          Tue, 09 Sep 2025 11:53:22 +0000 (UTC)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 09 Sep 2025 13:53:20 +0200
Message-Id: <DCO8YZ9DEAVI.3PUDOLPOHR1T3@mentallysanemainliners.org>
To: "AngeloGioacchino Del Regno" <angelogioacchino.delregno@collabora.com>
Cc: <linux-gpio@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>
Subject: Re: [PATCH 2/4] pinctrl: mediatek: Add support for eh bit
From: "Igor Belwon" <igor.belwon@mentallysanemainliners.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20250908-mt6878-pinctrl-support-v1-0-3fb78c8ab4e8@mentallysanemainliners.org> <20250908-mt6878-pinctrl-support-v1-2-3fb78c8ab4e8@mentallysanemainliners.org> <80a7339c-4742-45c1-b474-347a916b2db6@collabora.com>
In-Reply-To: <80a7339c-4742-45c1-b474-347a916b2db6@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250909_045335_350368_405B00E9 
X-CRM114-Status: GOOD (  12.98  )
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

On Tue Sep 9, 2025 at 9:57 AM CEST, AngeloGioacchino Del Regno wrote:
> Il 08/09/25 21:17, Igor Belwon ha scritto:
>> The eh bit is used for setting drive mode for i2c pins on recent SoCs.
>> Add support for it.
>>=20
>> Signed-off-by: Igor Belwon <igor.belwon@mentallysanemainliners.org>
>
> Noupe, this commit is not needed at all.
>
> I get that this may be tricky to understand... but summarizing, what the
> downstream calls "EH" in upstream is "DRV_ADV" :-)
>
> Check the comments on patch [4/4] about how to change EH to DRV_ADV.
>
> Cheers,
> Angelo

Whoops, sorry, I don't know how I missed that.
Will change as in your comments and drop this commit.

Thanks,
Igor

