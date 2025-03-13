Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55EC5C282DE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Mar 2025 08:37:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Subject:To:From:Date:Message-ID:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=1mulqT0pAzSVUrmF9PlZ7FDSmEsv6eq23fAgCC/7Ymw=; b=AVi97fEJD77nkgwL/azzCywGrC
	2LR1iW/dULoNvQ9SypNJTlWSNhs6vbi5g828Te4HJMR6forZUG5jUaFhJOXyq5dKWDs+/+lPL85W5
	PuB8c4hTFWE4yS5Ct78Kd7jAvp5ahDFhpWgtBAY439LEzdR/CdwcFWG7IhzQVYKqhXMk1YhLqQuFF
	HNGgTfUYX4ux++oBpyKYfHtuPLNyJVNMs7mT6eF1Dsb1qWioyNN/ysHHk63r9lWpN5Z69AJu/7/fI
	ZG+9TrwjZ/YNmNUQEpC1nVRmOGorQYxlupEsDiDfaQwjC5pn7XTj6cL9zJhUsRrMV4INxS11FkLtw
	wXirbsFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tse3e-0000000AZ9i-3L8K;
	Thu, 13 Mar 2025 08:36:50 +0000
Received: from mail.optiora.pl ([94.177.238.30])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tse0a-0000000AYj5-20M3
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Mar 2025 08:33:42 +0000
Received: by mail.optiora.pl (Postfix, from userid 1002)
	id 668A683237; Thu, 13 Mar 2025 09:31:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=optiora.pl; s=mail;
	t=1741854697; bh=1mulqT0pAzSVUrmF9PlZ7FDSmEsv6eq23fAgCC/7Ymw=;
	h=Date:From:To:Subject:From;
	b=HOywuPzhxw35n2PBqFjIlNpQARnutu2rGylGba5qx9zWXhdDXChqH5xOdcgtWfUpV
	 s1Q7FeAPAqnf9N/EOx9nL46mc/cvufK84luq5CmuiljoRhhNVHxVePNoEivnZBMwTS
	 E7h6mpB+clnJN4goGavQvONlPVMRPBJrz3mO3tXdRls+lhB6oePAqqc1NjNEQ394Qu
	 i+gYKnS1b5cxbMk53RpywCRDpmDbm+8+jrFPEW6IqrMsQC1pvdFLGBjL4OQsPAYe10
	 40uhTnjRy7xIHe79di0UEXc0+eE/rUiUdMWxu8/6qP9LgyTSn9zYn0VEzaL/gsuZX9
	 9Y/gs4KhbyDrg==
Received: by mail.optiora.pl for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Mar 2025 08:31:07 GMT
Message-ID: <20250313084500-0.1.88.w73z.0.frcbbnjy6p@optiora.pl>
Date: Thu, 13 Mar 2025 08:31:07 GMT
From: =?UTF-8?Q?"Stanis=C5=82awa_Laskowska"?= <stanislawa.laskowska@optiora.pl>
To: <linux-arm-kernel@lists.infradead.org>
Subject: Kandydat do pracy
X-Mailer: mail.optiora.pl
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250313_013341_203660_F0D63A55 
X-CRM114-Status: UNSURE (   2.42  )
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
Stanis=C5=82awa Laskowska

