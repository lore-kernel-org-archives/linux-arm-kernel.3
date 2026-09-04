Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD57FC79F82
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Sep 2026 15:13:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Message-Id:MIME-Version:To:Date:Subject:From:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=vcyZDykAqvCwktIBHqXV9lT4jpiDSEUII6a1SrCC7+4=; b=hoAPgZrhOr29/O91ofUsute6lE
	Kd4s0i1sZmlyCgdk3bqT/tU+98w8ucWfz4mMW6DKmy2ccL/q9IALy5E/MvGneRSOXt5xErDEtKq9p
	SQ5VpPORXDgIUerzFpH54Lx0zxMBNv2cYmILFuD39PuS/hhxBmUSZwE3+JFOgpWoib2SYlzGVObZK
	u8ONXfZ8RJlPHHDO0G034t8yxXoFPTWVdV5rEPZOoZyNBMDmHdve9IheQx2MzpN1ajEvJrccXclPg
	URze5eUtGfCmWSVNGJdzajYy2KxTB+Y54jfV82fRobwR8fR0NP6xxsgkv/18vf3ThjEdi5okVc4EV
	eD7cxbbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2VbT-00000002UEF-0vz3;
	Fri, 04 Sep 2026 15:13:19 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2VbP-00000002UDd-3Wwq
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Sep 2026 15:13:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1788534794;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=vcyZDykAqvCwktIBHqXV9lT4jpiDSEUII6a1SrCC7+4=;
	b=Ll1m4RrVQ7uA/vORfxhhzcuIjwp7VbBpmsT//ysqPj+luYLXl64w7+oOWiw5r8aUDYjU+g
	C4JgRcTQYAtsZ4Wge4+twsMcooAckpzJ1aQJmprrSmaqcTIXV3ef6iX8GtwqDfCG4QOxNU
	fDK1ZUjvneHGtQUrP/X2fmW/yc+0IhM=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-345-nNeCfN2VOO-SlBJAwhZsuQ-1; Fri,
 04 Sep 2026 11:13:07 -0400
X-MC-Unique: nNeCfN2VOO-SlBJAwhZsuQ-1
X-Mimecast-MFC-AGG-ID: nNeCfN2VOO-SlBJAwhZsuQ_1788534786
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 3ADDB195FDDF;
	Fri,  4 Sep 2026 15:13:06 +0000 (UTC)
Received: from [172.20.168.70] (unknown [10.30.45.63])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 9AC9818005AD;
	Fri,  4 Sep 2026 15:13:04 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for for-kernelci (7.3.0-rc1,
 upstream-arm-next, 5445d641)
Date: Fri, 04 Sep 2026 15:13:04 -0000
To: will@kernel.org, ftjahjad@redhat.com, catalin.marinas@arm.com,
 linux-arm-kernel@lists.infradead.org, bgoncalv@redhat.com
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
Message-Id: <96542.126090411130701183@us-mta-345.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: NJMn5brfCaL2Ad1PLbPHeMcPAQxgLShfRVeSy-G_Dkg_1788534786
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260904_081315_949090_CBCA9BB5 
X-CRM114-Status: UNSURE (   7.25  )
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
    Commit message: arm64: Don't read GMID_EL1 when MTE is disabled

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:2820274415

One or more kernel tests failed:
    Unrecognized or new issues:
        Boot test
             aarch64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:2820274415_aarch64_kernel_kcidb_tool_1200162511_6
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL distribution/kpkginstall/journalctl-c=
heck
             aarch64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:2820274415_aarch64_kernel_kcidb_tool_1200162512_6
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL distribution/kpkginstall/journalctl-c=
heck
             aarch64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:2820274415_aarch64_kernel_kcidb_tool_1200162513_6
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL distribution/kpkginstall/journalctl-c=
heck
        Reboot test
             aarch64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:2820274415_aarch64_kernel_kcidb_tool_1200162511_9
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL misc/reboot-test/journalctl-check
             aarch64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:2820274415_aarch64_kernel_kcidb_tool_1200162512_9
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL misc/reboot-test/journalctl-check
             aarch64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:2820274415_aarch64_kernel_kcidb_tool_1200162513_9
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL misc/reboot-test/journalctl-check

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


