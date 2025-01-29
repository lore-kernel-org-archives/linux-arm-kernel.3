Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E4C6C0218D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Jan 2025 16:21:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wgccypM608yn+N2BvL1dQlkUG29OMNY3loixTZzNS0w=; b=bYn1oqKYqIsveot9Z4yTTK0YSB
	a+65ILPdCoyfxFDnLRxAnqSahKTaJ9H1Fh3LI9nwsAC9m+0wmUsWZ8Bs5VnOTvsr+1gCCi2VyKhvl
	RAlotRhGAcziKa2u5fUDJ8Gipj3jMuovrqhowuRUGYwISN6sqod7BDQ7uDZv+rTBnsXrqrbJYmIx5
	57doSWNrFUs9P8x5M6wn+q84gZMmxTrTD9UlYCxi3Y/nax+8kZwnJ1ZJ6WJAh+LyHoM2OchCKQlHZ
	55eqNzYsGmuk+wAI9sfAVqRGPGzo1pdXgfN3qv9NQcN4f/ZVo6gCePtlyAQ0ThAM/HGuJaZ8CRHCL
	QXI+KbHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tdAo8-00000007NDk-11Wb;
	Wed, 29 Jan 2025 16:20:52 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tdAmn-00000007MvE-264Q
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Jan 2025 16:19:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id D7828A41970;
	Wed, 29 Jan 2025 16:17:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DDB92C4CED1;
	Wed, 29 Jan 2025 16:19:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738167568;
	bh=VQ1tE7auwykWHFaAWlmFtxRv+H5gTV+mb3VLluuo+bU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=n/4WzsGK81F59SkkUMb+WMCMS5ZHaRbmeLw6ahJDhfCBABA4a6KVBCSwK9uQe2dCx
	 x0mNRgNXoAzA3H2ahKHYKJqAKXXN8MREVyvIrV0GgJAcoI7h6gX9LHdjLTxtClMSx4
	 EddIHSjyw6wAz2IS3Q+EeK4Ip3z4ZZbwoD7CtalDQ7OeIU8gJmPRFPLhFO6904UeOL
	 pbOtP49em5EsHn7LjmGJCQd4vKS5POHzZdHn43fsshTYlLqDnGfVcMwX7Xp0QR2BJT
	 vmSJuwnOZQMB3s3i2xEUR2Vvxazeak0N6s9PY8c7YRZAkNftTuLHW4TgGq2APSSIua
	 GqdW/Bxq24vdQ==
Date: Wed, 29 Jan 2025 17:19:22 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>
Cc: Linux Doc Mailing List <linux-doc@vger.kernel.org>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 bpf@vger.kernel.org, coresight@lists.linaro.org,
 linux-arm-kernel@lists.infradead.org, linux-block@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-hardening@vger.kernel.org,
 linux-iio@vger.kernel.org, linux-media@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-wireless@vger.kernel.org, netdev@vger.kernel.org,
 workflows@vger.kernel.org
Subject: Re: [RFC v2 00/38] Improve ABI documentation generation
Message-ID: <20250129171922.4322c338@foz.lan>
In-Reply-To: <87a5b96296.fsf@trenco.lwn.net>
References: <cover.1738020236.git.mchehab+huawei@kernel.org>
	<87h65i7e87.fsf@trenco.lwn.net>
	<20250129164157.3c7c072d@foz.lan>
	<87a5b96296.fsf@trenco.lwn.net>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250129_081929_670573_D861EFFA 
X-CRM114-Status: GOOD (  11.89  )
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

Em Wed, 29 Jan 2025 08:58:13 -0700
Jonathan Corbet <corbet@lwn.net> escreveu:

> Mauro Carvalho Chehab <mchehab+huawei@kernel.org> writes:
> 
> > So, I'm proposing to change the minimal requirements to:
> > 	- Sphinx 3.4.3;
> > 	- Python 3.9
> >
> > By setting Sphinx minimal version to 3.4.3, we can get rid of all
> > Sphinx backward-compatible code.  
> 
> That's certainly a nice thought.
> 
> With regard to Python ... are all reasonable distributions at 3.9 at
> least?  CentOS 9 seems to be there, and Debian beyond it.  So probably
> that is a reasonable floor to set?

I didn't check, but those are the current minimal versions above 3.5 for
what we have at the Kernel tree[1]:

            !2, 3.10     tools/net/sunrpc/xdrgen/generators/__init__.py
            !2, 3.10     tools/net/sunrpc/xdrgen/generators/program.py
            !2, 3.10     tools/net/sunrpc/xdrgen/subcmds/source.py
            !2, 3.10     tools/net/sunrpc/xdrgen/xdr_ast.py
            !2, 3.10     tools/power/cpupower/bindings/python/test_raw_pylibcpupower.py
            !2, 3.9      tools/testing/selftests/net/rds/test.py
            !2, 3.9      tools/net/ynl/ethtool.py
            !2, 3.9      tools/net/ynl/cli.py
            !2, 3.9      scripts/checktransupdate.py
            !2, 3.8      tools/testing/selftests/tc-testing/plugin-lib/nsPlugin.py
            !2, 3.8      tools/testing/selftests/hid/tests/base.py
            !2, 3.7      tools/testing/selftests/turbostat/smi_aperf_mperf.py
            !2, 3.7      tools/testing/selftests/turbostat/defcolumns.py
            !2, 3.7      tools/testing/selftests/turbostat/added_perf_counters.py
            !2, 3.7      tools/testing/selftests/hid/tests/conftest.py
            !2, 3.7      tools/testing/kunit/qemu_config.py
            !2, 3.7      tools/testing/kunit/kunit_tool_test.py
            !2, 3.7      tools/testing/kunit/kunit.py
            !2, 3.7      tools/testing/kunit/kunit_parser.py
            !2, 3.7      tools/testing/kunit/kunit_kernel.py
            !2, 3.7      tools/testing/kunit/kunit_json.py
            !2, 3.7      tools/testing/kunit/kunit_config.py
            !2, 3.7      tools/perf/scripts/python/gecko.py
            !2, 3.7      scripts/rust_is_available_test.py
            !2, 3.7      scripts/bpf_doc.py
            !2, 3.6      tools/writeback/wb_monitor.py
            !2, 3.6      tools/workqueue/wq_monitor.py
            !2, 3.6      tools/workqueue/wq_dump.py
            !2, 3.6      tools/usb/p9_fwd.py
            !2, 3.6      tools/tracing/rtla/sample/timerlat_load.py
            !2, 3.6      tools/testing/selftests/net/openvswitch/ovs-dpctl.py
            !2, 3.6      tools/testing/selftests/net/nl_netdev.py
            !2, 3.6      tools/testing/selftests/net/lib/py/ynl.py
            !2, 3.6      tools/testing/selftests/net/lib/py/utils.py
            !2, 3.6      tools/testing/selftests/net/lib/py/nsim.py
            !2, 3.6      tools/testing/selftests/net/lib/py/netns.py
            !2, 3.6      tools/testing/selftests/net/lib/py/ksft.py
            !2, 3.6      tools/testing/selftests/kselftest/ksft.py
            !2, 3.6      tools/testing/selftests/hid/tests/test_tablet.py
            !2, 3.6      tools/testing/selftests/hid/tests/test_sony.py
            !2, 3.6      tools/testing/selftests/hid/tests/test_multitouch.py
            !2, 3.6      tools/testing/selftests/hid/tests/test_mouse.py
            !2, 3.6      tools/testing/selftests/hid/tests/base_gamepad.py
            !2, 3.6      tools/testing/selftests/hid/tests/base_device.py
            !2, 3.6      tools/testing/selftests/drivers/net/stats.py
            !2, 3.6      tools/testing/selftests/drivers/net/shaper.py
            !2, 3.6      tools/testing/selftests/drivers/net/queues.py
            !2, 3.6      tools/testing/selftests/drivers/net/ping.py
            !2, 3.6      tools/testing/selftests/drivers/net/lib/py/remote_ssh.py
            !2, 3.6      tools/testing/selftests/drivers/net/lib/py/load.py
            !2, 3.6      tools/testing/selftests/drivers/net/lib/py/__init__.py
            !2, 3.6      tools/testing/selftests/drivers/net/lib/py/env.py
            !2, 3.6      tools/testing/selftests/drivers/net/hw/rss_ctx.py
            !2, 3.6      tools/testing/selftests/drivers/net/hw/pp_alloc_fail.py
            !2, 3.6      tools/testing/selftests/drivers/net/hw/nic_performance.py
            !2, 3.6      tools/testing/selftests/drivers/net/hw/nic_link_layer.py
            !2, 3.6      tools/testing/selftests/drivers/net/hw/lib/py/linkconfig.py
            !2, 3.6      tools/testing/selftests/drivers/net/hw/lib/py/__init__.py
            !2, 3.6      tools/testing/selftests/drivers/net/hw/devmem.py
            !2, 3.6      tools/testing/selftests/drivers/net/hw/devlink_port_split.py
            !2, 3.6      tools/testing/selftests/drivers/net/hw/csum.py
            !2, 3.6      tools/testing/selftests/devices/probe/test_discoverable_devices.py
            !2, 3.6      tools/testing/selftests/bpf/test_bpftool_synctypes.py
            !2, 3.6      tools/testing/selftests/bpf/generate_udp_fragments.py
            !2, 3.6      tools/testing/kunit/run_checks.py
            !2, 3.6      tools/testing/kunit/kunit_printer.py
            !2, 3.6      tools/sched_ext/scx_show_state.py
            !2, 3.6      tools/perf/tests/shell/lib/perf_metric_validation.py
            !2, 3.6      tools/perf/tests/shell/lib/perf_json_output_lint.py
            !2, 3.6      tools/perf/scripts/python/parallel-perf.py
            !2, 3.6      tools/perf/scripts/python/flamegraph.py
            !2, 3.6      tools/perf/scripts/python/arm-cs-trace-disasm.py
            !2, 3.6      tools/perf/pmu-events/models.py
            !2, 3.6      tools/perf/pmu-events/metric_test.py
            !2, 3.6      tools/perf/pmu-events/metric.py
            !2, 3.6      tools/perf/pmu-events/jevents.py
            !2, 3.6      tools/net/ynl/ynl-gen-rst.py
            !2, 3.6      tools/net/ynl/ynl-gen-c.py
            !2, 3.6      tools/net/ynl/lib/ynl.py
            !2, 3.6      tools/net/ynl/lib/nlspec.py
            !2, 3.6      tools/crypto/tcrypt/tcrypt_speed_compare.py
            !2, 3.6      tools/cgroup/iocost_monitor.py
            !2, 3.6      tools/cgroup/iocost_coef_gen.py
            !2, 3.6      scripts/make_fit.py
            !2, 3.6      scripts/macro_checker.py
            !2, 3.6      scripts/get_abi.py
            !2, 3.6      scripts/generate_rust_analyzer.py
            !2, 3.6      scripts/gdb/linux/timerlist.py
            !2, 3.6      scripts/gdb/linux/pgtable.py
            !2, 3.6      scripts/clang-tools/run-clang-tools.py
            !2, 3.6      Documentation/sphinx/automarkup.py

[1] Checked with:
	vermin -v $(git ls-files *.py)

    Please notice that vermin is not perfect: my script passed as version 3.6
    because the f-string check there didn't verify f-string improvements over
    time. Still, it is a quick way to check that our current minimal version
    is not aligned with reality.
 
Btw, vermin explains what is requiring more at the scripts. For instance:

	$ vermin -vv scripts/checktransupdate.py
	...
	!2, 3.9      /new_devel/v4l/docs/scripts/checktransupdate.py
	  'argparse' module requires 2.7, 3.2
	  'argparse.BooleanOptionalAction' member requires !2, 3.9
	  'datetime' module requires 2.3, 3.0
	  'datetime.datetime.strptime' member requires 2.5, 3.0
	  'logging' module requires 2.3, 3.0
	  'logging.StreamHandler' member requires 2.6, 3.0
	  'os.path.relpath' member requires 2.6, 3.0
	  f-strings require !2, 3.6

Thanks,
Mauro

