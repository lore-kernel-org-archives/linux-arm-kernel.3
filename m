Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 848B6C83038
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Jun 2025 19:07:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UwpfdKKAP0Dpi9Jx8uluf+vHM18ELNWDkG6W66B7x1o=; b=B9mKYeT6krAgFqDEhuId0F7X0M
	5vBrGxFAkKmI85y1h/lQdE5g6iyiFM8zbkeRDrpQAPX8TeT4aXAYutm9+xBvOGBybe/pq7Grq+bne
	UbCgL75Rvk899jMD176clERVX03osqQ6RoZGSo9LsEXCqDquubStRkjEJJkZ6jjYPz4AS2gs7U30c
	UQdhVwxW9exTEyfHq5wY8onifw2wW9ZtBcmNChsRPyeGSstodjUMd75zx+e0JaqpPWswExdou19Ch
	hNkfPclPKn6j02HrcZZjLjs4l6xGqxhLtN3/eWsa6QN+BN4se3F0/XnfIul10oYCjhBQHOFMMlkYf
	Wd+2rDCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWJqY-00000003FtC-1kUP;
	Mon, 30 Jun 2025 19:07:18 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWJlw-00000003FKK-17xv
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 30 Jun 2025 19:02:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=UwpfdKKAP0Dpi9Jx8uluf+vHM18ELNWDkG6W66B7x1o=; b=QvthliJFNIZvIAHtPJzjbOr9sr
	s4juwhwyGdTCwyi89q/yB8dyOjAUsfAuPzzCU7pfDewzxkn6Knq7JcKaQcuVwbCmmPMw7kLAUeJsY
	vcAhFjkTyWQuOQ906HtUrBJgAkFEBV4S5V8wSozO/miRzG/iWGqOkCTvPeLaRZCkkwWCpUBj5sJor
	Tun9IY4nhfOdUjRMJR/OJQXAh2/ApsXBgTt7J4ZMCuqlXyWB8dTgH9nntqDzQUc5m8WewP7tKat6R
	Fcp7MTrVnWmXACmeBG/kOouwnDav7d/dpaQE64eQSG52qsRZ5eSSpYgvnKECEx7JfaWHuwEX7IV3D
	xcWgEpAw==;
Received: from relay.smtp-ext.broadcom.com ([192.19.166.228])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWJls-00000006s7V-19Gt
	for linux-arm-kernel@lists.infradead.org;
	Mon, 30 Jun 2025 19:02:30 +0000
Received: from mail-lvn-it-01.broadcom.com (mail-lvn-it-01.lvn.broadcom.net [10.36.132.253])
	by relay.smtp-ext.broadcom.com (Postfix) with ESMTP id 9F765C0008FA;
	Mon, 30 Jun 2025 12:02:22 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 relay.smtp-ext.broadcom.com 9F765C0008FA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=broadcom.com;
	s=dkimrelay; t=1751310142;
	bh=JqlyPedRZUhsVo+NJJ45KcQXUcPxZUrlE9NB6DPaZoI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=kBPv9bHrBKHu5kdDd61viFvVO7yOXSpP/wAKhHRhnbbk95LdHJAabSqT1JpHGDnAO
	 1EnfoGJEIhMMU823Y87JyHqipcB2ANNt/2f2QOMdSu8E900seEXZza9VW8IPI9wJgl
	 PcgYxrpigT6jxpuvzw8wzj+trNfDS9HHEmw7qyUQ=
Received: from fainelli-desktop.igp.broadcom.net (fainelli-desktop.dhcp.broadcom.net [10.67.48.245])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail-lvn-it-01.broadcom.com (Postfix) with ESMTPSA id 6A9F818000944;
	Mon, 30 Jun 2025 12:02:22 -0700 (PDT)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: soc@kernel.org
Cc: Andrea della Porta <andrea.porta@suse.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	linux-arm-kernel@lists.infradead.org,
	arnd@arndb.de,
	khilman@kernel.org,
	bcm-kernel-feedback-list@broadcom.com
Subject: [GIT PULL 5/5] Broadcom maintainers changes for 6.17
Date: Mon, 30 Jun 2025 12:02:16 -0700
Message-ID: <20250630190216.1518354-5-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250630190216.1518354-1-florian.fainelli@broadcom.com>
References: <20250630190216.1518354-1-florian.fainelli@broadcom.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250630_200229_120204_FFE7A846 
X-CRM114-Status: UNSURE (   7.87  )
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

The following changes since commit 19272b37aa4f83ca52bdf9c16d5d81bdd1354494:

  Linux 6.16-rc1 (2025-06-08 13:44:43 -0700)

are available in the Git repository at:

  https://github.com/Broadcom/stblinux.git tags/arm-soc/for-6.17/maintainers

for you to fetch changes up to 4a525d5d3150a3e387cb841f927f07eb4a98c368:

  MAINTAINERS: add Raspberry Pi RP1 section (2025-06-09 10:11:39 -0700)

----------------------------------------------------------------
This pull request contains MAINTAINERS file updates for 6.17, please
pull the following:

- Andrea adds the RP1 entry for all of the drivers pertaining to that
  chip

----------------------------------------------------------------
Andrea della Porta (1):
      MAINTAINERS: add Raspberry Pi RP1 section

 MAINTAINERS | 8 ++++++++
 1 file changed, 8 insertions(+)

