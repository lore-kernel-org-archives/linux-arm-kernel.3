Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BE66C3ABC3
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 May 2025 07:40:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Subject:To:From:Date:Message-ID:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Z5A/YjlmRq81vAVPa7DDy3UE78Abw5tIg5SA/4wpuQM=; b=pe9zsoosSbPMVZxqFv0vRMqMUs
	SgLHcpe5u0gWMAHhOSZmpWjusJIlq3vC4aUOPvBHrAXkcbEEEzY4DE57jZ9CEX5mmKsVgiHeGbUwR
	2B0q0mezUkPD86ylUx3wze9gWHv6H3BtSdMdhsWRtWeWuQlQYfdHVUBq5j4rbn69c1NYyWlYgR9Iy
	LrJk3BK95s1lloicbnV/YTiNdnM79rWrGfiERQeQTiC05xwrtjY4xhVMwhI14YzN1NCugJZ2XGiDo
	o+6vKye8mqTbglVLLgKdcXYBSlpw1770w564Vp1lgO0kcQkriGwO1xvolKS8v6/gQENStCxah+RGh
	FxwuKRrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEkFG-0000000BeAQ-0g2y;
	Tue, 13 May 2025 07:40:10 +0000
Received: from mail.bizcrafty.pl ([94.177.230.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEkDE-0000000Bdml-3fcl
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 May 2025 07:38:07 +0000
Received: by mail.bizcrafty.pl (Postfix, from userid 1002)
	id 744E382DBD; Tue, 13 May 2025 09:35:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=bizcrafty.pl; s=mail;
	t=1747121807; bh=Z5A/YjlmRq81vAVPa7DDy3UE78Abw5tIg5SA/4wpuQM=;
	h=Date:From:To:Subject:From;
	b=C5jW1mJi4sTN2wENyn7Hh77gpELe3+KCchL/KFu+OFsxMUUn9UivqeGBCyl2mQ+dd
	 XAKDVUO4xMV1vG9vuTzUlXKsIfNh8CBEuF4lGz8wrodVGLiYxePSe/itjL/KRIPBGE
	 /a6HMbK/W1tTAqDvMrvzWcmiQF7tpttvZDq3xyl7rd7ILRMb/5wbXBQXbDL0PUUq9g
	 xkAv3wsRJSCMb7S8SmfGPhgpD9fvbAALrLcINzj+lyFuLm0aCwTEQhzd4MTbFna/Eb
	 Y1O6f+IZvej8auRDgSTf2LCSCQ8xp/kC1V44aBEZrxTdsNr4+R/fwzPkdYJ5hF9cPo
	 TarB49Yn9323w==
Received: by mail.bizcrafty.pl for <linux-arm-kernel@lists.infradead.org>; Tue, 13 May 2025 07:35:24 GMT
Message-ID: <20250513084500-0.1.7k.hzyi.0.lnnp4pb51r@bizcrafty.pl>
Date: Tue, 13 May 2025 07:35:24 GMT
From: "Joanna Werner" <joanna.werner@bizcrafty.pl>
To: <linux-arm-kernel@lists.infradead.org>
Subject: Kandydat do pracy
X-Mailer: mail.bizcrafty.pl
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250513_003805_586751_D8034F8E 
X-CRM114-Status: UNSURE (   1.89  )
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

Dzie=C5=84 dobry,

delegujemy sprawdzone osoby ze Wschodu do pracy w firmach produkcyjnych d=
o prostych prac przy produkcji, na magazynie, przy pakowaniu towaru czy k=
ontroli jako=C5=9Bci.=20

Nasza firma organizuje wszelkie formalno=C5=9Bci oraz zakwaterowanie, co =
pozwala zmniejszy=C4=87 koszty po Pa=C5=84stwa stronie.

Czy mog=C4=99 przedstawi=C4=87 szczeg=C3=B3=C5=82y?


Pozdrawiam
Joanna Werner

