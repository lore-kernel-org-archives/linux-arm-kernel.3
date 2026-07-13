Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 975ACC44508
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jul 2026 14:57:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Message-Id:MIME-Version:To:Date:Subject:From:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=fzqeBNGFUSG/sgvckq8jrZxfuvwxOhZopWHb6crRqZI=; b=hY9QQNYwvdremjgr8+z7IrUwKL
	mjnQdI7NT+d/RCadIV8iZhm4k4f1p+1aeMOrKLjdFema4H76yzEhM16f3OXOE+IQmYNl4T0s+t29G
	0Fuq5I9mOR2ZRtmdIpk8Wgp4hU/1d7UlOqLIUb9ENgCbDI6IufqiBEPW1bV3d3CziND40SCHnyFEb
	rum3H3nq2ekoOUgvDfqnLJawZGIp61EsdQSLoVBjIGmrzvH+XiMk/y6JkC/d5mi9xkHflsIQUIIfJ
	u7QIRpWZLn8svECo17V9LNXsp2FqjSY0zSSRhEDldDUuf0lwcupTvFMITcelXkXRdmVSb8C+9hdQl
	4oK7TIzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjHmA-00000009cFQ-05dO;
	Mon, 13 Jul 2026 14:36:54 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjHm9-00000009cFG-1KhW
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 13 Jul 2026 14:36:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Message-Id:MIME-Version:To:Date:Subject:From:Sender:Reply-To:Cc:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=fzqeBNGFUSG/sgvckq8jrZxfuvwxOhZopWHb6crRqZI=; b=ZOd4x38oXGnd64X9ttysdecvJ3
	IQBiHpevEy6LLVYz/2Rb/7jVa9HJRavBQ6xN8dG5znkE3yDY6JhFQf/D6sFmhF6ZYUh6owerpt0ch
	PvBmiAK9EJj6bT9arb3O3LBiEZMkPvHaWHJMX29TirgjQFGxLi8VmeYo13iDIDE0B242j9XfpesmU
	v4lQc5nePyGxUyOZgwAQjW8UBQk/bttm2mXmgONarbUcQt1OULAD+3weQIalWSL6QwyP/NmBkrQig
	QeGQvNzb5Ko0GzmsLwwIvXudX1sdXpmbbtjkKqeaL5zgML3fMe/YJxm6Reeue2JhQJjkQ9VziJAIG
	4rmapFPw==;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wjHm4-0000000BipA-47Mn
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jul 2026 14:36:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1783953277;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=fzqeBNGFUSG/sgvckq8jrZxfuvwxOhZopWHb6crRqZI=;
	b=fn3CIfeIpPOEMIBoE6XiHR96ZvqVIrJEzY4jRlvGp8xFlaf+PD+wGfRPe1UKg/URCTHSbf
	Edi0n3il6E0jLpUGZyzrfViJcCAYhk3bENr6TxiSBbpwf2ZOHsuiT4ewXJf/SaCDV1mpTo
	MnCD8ioX9UVE3ZVeExOjkbLrk4swpmU=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1783953406;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=fzqeBNGFUSG/sgvckq8jrZxfuvwxOhZopWHb6crRqZI=;
	b=KPAilJBV3iYIuTVNEL+1Wr5kcL2m+5d1kZx8C0HwmEcKAMnddf12fbCue9Mg6NuStd14fQ
	NlwqBZKarw2xlWQrBGB7gy1W1OWNUOuRJ3q6Yus2XzCaYdQ4Rg0AWn+t+CPRNNWgBUze9e
	GBSiJ+IAN+BcIySPbS1ctxdRLcSSP4w=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-519-ToQnaOugNdi72RLQ5gxyYQ-1; Mon,
 13 Jul 2026 10:33:05 -0400
X-MC-Unique: ToQnaOugNdi72RLQ5gxyYQ-1
X-Mimecast-MFC-AGG-ID: ToQnaOugNdi72RLQ5gxyYQ_1783953184
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 9C2B41955D69;
	Mon, 13 Jul 2026 14:33:03 +0000 (UTC)
Received: from [172.20.37.180] (unknown [10.30.44.214])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 294EC1956056;
	Mon, 13 Jul 2026 14:33:02 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for for-kernelci (7.2.0-rc3,
 upstream-arm-next, a13c140c)
Date: Mon, 13 Jul 2026 14:33:01 -0000
To: will@kernel.org, fs-test@redhat.com, ftjahjad@redhat.com,
 linux-arm-kernel@lists.infradead.org, bgoncalv@redhat.com,
 catalin.marinas@arm.com
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
Message-Id: <53436.126071310330500503@us-mta-519.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: IJ6T_w9u9h8XeaQOFwSgNCfp5iJEcJ3E2TGjlycDkpY_1783953184
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_153649_240960_45557229 
X-CRM114-Status: UNSURE (   6.74  )
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

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: OK
              Test: FAILED


Kernel information:
    Commit message: Linux 7.2-rc3

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:2672637327

One or more kernel tests failed:
    Unrecognized or new issues:
        Boot test
             aarch64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:2672637327_aarch64_kernel_kcidb_tool_21630468_6
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL distribution/kpkginstall/journalctl-c=
heck
        Reboot test
             aarch64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:2672637327_aarch64_kernel_kcidb_tool_21630468_11
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL misc/reboot-test/journalctl-check
        xfstests - btrfs
             aarch64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:2672637327_aarch64_kernel_kcidb_tool_21630471_9
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL generic/301

    We also see the following known issues which are not related to your ch=
anges:
        Issue: [upstream] Hardware - Firmware test suite - auto-waive failu=
res
            URL: https://gitlab.com/cki-project/infrastructure/-/issues/779
            Affected tests:
                Hardware - Firmware test suite [aarch64]



If you find a failure unrelated to your changes, please ask the test mainta=
iner to review it.
This will prevent the failures from being incorrectly reported in the futur=
e.

Please reply to this email if you have any questions about the tests that w=
e
ran or if you have any suggestions on how to make future tests more effecti=
ve.

        ,-.   ,-.
       ( C ) ( K )  Continuous
        `-',-.`-'   Kernel
          ( I )     Integration
           `-'
___________________________________________________________________________=
___


